class GroupsController < ApplicationController
  def show
    set_group
    authorize @group
  end

  def index
    @groups = policy_scope(Group)
    # @groups = Group.includes(:chats, :challenges, :users)
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @group = Group.new
    authorize @group
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @group = Group.new(group_params)
    @group.challenge = @challenge
    @chatroom = Chatroom.new
    @chatroom.save
    @group.chatroom = @chatroom
    authorize @group
    @group.difficulty = @group.challenge.default_difficulty * (@group.duration.fdiv(100))
    @group.impact = @group.challenge.default_impact - (@group.exceptions.fdiv(100))
    @users_group = UserGroup.new(group: @group, user: current_user)
    @users_group.group = @group
    if @group.save
      @users_group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def completed
    @group = Group.find(params[:id])
    @group.update_attribute(:completed, 'true')
    flash[:notice] = "Yey"
    # redirect_to @group
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:completed, :difficulty, :impact, :duration, :exceptions, :points)
  end
end
