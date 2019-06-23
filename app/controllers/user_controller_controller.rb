class UserControllerController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find(id: params[:id])
  end

  def update
    @user = User.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :locale)
  end
end
