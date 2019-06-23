class GroupController < ApplicationController
  before_action :authorize_request

  # GET /groups
  def index
    groups = Group.all
    render json: groups
  end

  # POST /groups
  def create
    group = Group.create(group_params)
    render json: group
  end

  # PUT /groups/:id
  def update
    group = Group.update(group_params)
    render json: group
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
