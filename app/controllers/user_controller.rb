class UserController < ApplicationController
  before_action :authorize_request, except: :create

  # GET /users
  def index
    users = User.all
    render json: serializer.new(users)
  end

  # POST /users
  def create
    if user = User.create(user_params)
      render json: serializer.new(user), status: :created
    else
      render_error(user.errors.full_messages, :unprocessable_entity)
    end
  end

  # GET /users/:id
  def show
    user = User.find(id: params[:id])
    render json: serializer.new(user)
  end

  # PUT /users/:id
  def update
    if user = User.update(user_params)
      render json: serializer.new(user)
    else
      render_error(user.errors.full_messages, :unprocessable_entity)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :locale)
  end

  def serializer
    UserSerializer
  end
end
