class GroupsController < ApplicationController
  def show
    set_group
    authorize @group
  start_date = @group.created_at
  end_date = start_date + (@group.duration).days
  @total_days = ((end_date - start_date) / 86400 * 7).round
  @remaining_days = [((end_date - DateTime.now) / 86400 * 7).round, 0].max
  @user_group = UserGroup.where("group_id = #{@group.id} and user_id = #{current_user.id}").to_a
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
    @impact = @challenge.default_impact.to_i
    @difficulty = @challenge.default_impact.to_i
    @group.impact = (@challenge.default_impact.to_i * @group.duration.to_i)
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
    @group.points = @group.difficulty * @group.impact * 10
    @users_group = UserGroup.new(group: @group, user: current_user, status: 'active')
    @users_group.group = @group

    @challenges = []
    current_user.user_groups.each do |user_group|
      if user_group.status == "active"
        @challenges << user_group.group.challenge
      else
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

  def calculate_points
    @group.difficulty = @group.challenge.default_difficulty - @group.exceptions
    @group.impact = (@group.challenge.default_impact * @group.duration)
    @group.points = @group.difficulty * @group.impact * 10
  end

  def completed
    @group = Group.find(params[:id])
    @group.update_attribute(:completed, true)
    @user_group = UserGroup.where("group_id = #{@group.id} and user_id = #{current_user.id}").to_a
    @user_group.first.status = "completed"
    current_user.points += @group.points
    @user_group.first.save
    current_user.save

    if current_user.save
      flash[:notice] = ""
      authorize @group
      redirect_to group_path(@group)
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:calculate_points, :completed, :difficulty, :impact, :duration, :exceptions, :points)
  end
end
