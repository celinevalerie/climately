class GroupsController < ApplicationController
  def show
    set_user
  end

  def index
    @groups = Group.all
  end

  private

  def set_user
    @group = Group.find(params[:id])
  end

  def user_params
    params.require(:group).permit(:completed, :difficulty, :impact, :duration, :exeptions, :points)
  end
end
