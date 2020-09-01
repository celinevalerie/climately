class GroupsController < ApplicationController
  def show
    set_group
  end

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new(params[:id])
  end

  def create
    @group = Group.new(params[:id])
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])

  def group_params
    params.require(:group).permit(:completed, :difficulty, :impact, :duration, :exeptions, :points)
  end
end
end
