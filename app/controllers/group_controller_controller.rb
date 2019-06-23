class GroupControllerController < ApplicationController
  def index
    # Definitely want to have some authorization here
    @groups = Group.all
  end

  def create
    @group = Group.create(group_params)
  end

  def update
    @group = Group.update(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
