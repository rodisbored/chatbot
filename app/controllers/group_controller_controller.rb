class GroupControllerController < ApplicationController
  def index
    groups = Group.all
    render json: groups
  end

  def create
    group = Group.create(group_params)
    render json: group
  end

  def update
    group = Group.update(group_params)
    render json: group
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
