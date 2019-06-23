class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now.utc + 24.hours.to_i
      render json: {
        token: token,
        exp: time.strftime('%m-%d-%Y %H:%M'),
        username: @user.username
      }
    else
      render_error('unauthorized', :unauthorized)
    end
  end

  private

  def login_params
    params.require(:authentication).permit(:email, :password)
  end
end
