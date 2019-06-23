class ApplicationController < ActionController::API
  # Need authentication module

  protect_from_forgery with: :exception

  def not_found
    render json: { error: 'not_found' }
  end

  def render_error(msg, status)
    render json: { errors: msg }, status: status
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.full_message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.full_message }, status: :unauthorized
    end
  end
end
