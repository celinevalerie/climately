class UserGroupsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @challenge = @group.challenge
    @friends = current_user.friends
    authorize @group
  end
  
  def create 
    session[:return_to] ||= request.referer
    @friend = User.find(params[:friend_id])
    @group = Group.find(params[:group_id])

    @usergroup = UserGroup.new(user: @friend, group: @group, status: "invited")
    authorize @usergroup

    @challenges = []
    @friend.user_groups.each do |user_group|
      if user_group.status == "active"
        @challenges << user_group.group.challenge
      end
    end

    if @challenges.include? (@usergroup.group.challenge)
      flash[:notice] = "Already doing challenge: #{@usergroup.group.challenge.name}"
      redirect_to new_group_user_group_path(@usergroup.group)
    else
      if @usergroup.save
        redirect_to new_group_user_group_path(@usergroup.group)
      else 
        render :new
      end
    end
  end

  def giveup
    @usergroup = UserGroup.find(params[:id])
    @usergroup.status = "failed"
    if @usergroup.save
    authorize @usergroup
    redirect_to groups_path
    end
  end

  def accept
    @usergroup = UserGroup.find(params[:id])
    @usergroup.status = "active"
    if @usergroup.save
      authorize @usergroup
      redirect_to groups_path
    end
  end

  def decline
    @usergroup = UserGroup.find(params[:id])
    @usergroup.status = "declined"
    if @usergroup.save
      authorize @usergroup
      redirect_to groups_path
    end
  end
end
