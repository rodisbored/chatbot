class UserControllerController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    render json: user
  end

  def show
    user = User.find(id: params[:id])
    render json: user
  end

  def update
    user = User.update(user_params)
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :locale)
  end
end
