class GroupsController < ApplicationController
  def show
    set_group
    authorize @group
  end

  def index
    @groups = policy_scope(Group)
  end

  def new
    @group = Group.new(params[:id])
    authorize @group
  end

  def create
    @group = Group.new(params[:id])
    @chatroom = Chatroom.new
    @group.chatroom = @chatroom
    authorize @group
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def completed
    @group = Group.find(params[:id])
    @group.update_attribute(:completed, 'true')
    flash[:notice] = "Yey"
    # redirect_to
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:completed, :difficulty, :impact, :duration, :exeptions, :points)
  end
end
