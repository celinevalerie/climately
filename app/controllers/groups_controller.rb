class GroupsController < ApplicationController
  def show
    set_group
    authorize @group
  end

  def index
    @navbartitle = "Dashboard"
    @groups = policy_scope(Group)
    if params.has_key?(:status)
      @usergroups = []
      @groups.each do | group |
        @usergroups << group.user_groups.select {|usergroup| usergroup.status == params[:status] && usergroup.user == current_user}
      end
      @usergroups.flatten!
      @status = params[:status]
    else
      @usergroups = []
      @groups.each do | group |
        @usergroups << group.user_groups.select {|usergroup| usergroup.status == 'active' && usergroup.user == current_user}
      end
      @usergroups.flatten!
      @status = 'active'
    end

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
    if @group.exceptions > @group.challenge.default_difficulty
      flash[:notice] = "This is too easy"
    else
      @group.difficulty = @group.challenge.default_difficulty - @group.exceptions
    end
    @group.impact = (@group.challenge.default_impact * @group.duration)
    @group.points = @group.difficulty * @group.impact
    @users_group = UserGroup.new(group: @group, user: current_user, status: 'active')
    @users_group.group = @group

    @challenges = []
    current_user.user_groups.each do |user_group|
      if user_group.status = "active"
        @challenges << user_group.group.challenge
      end
    end
    if @challenges.include? (@challenge)
      flash[:notice] = "Already doing challenge: #{@challenge.name}"
      redirect_to challenges_path
    else
    if @group.save
      @users_group.save
      redirect_to new_group_user_group_path(@group)
    else
      render :new
    end
  end
  end

  def completed
    @group = Group.find(params[:id])
    @group.update_attribute(:completed, 'true')
    @group.user_groups.each do |user_group|
      user_group.update_attribute(:status, 'completed')
      user_group.save
    end
    flash[:notice] = ""
    authorize @group
    redirect_to group_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:completed, :difficulty, :impact, :duration, :exceptions, :points)
  end
end
