class UserGroupsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @challenge = @group.challenge
    @friends = current_user.friends
    authorize @group
  end
  
  def create 
    @friend = User.find(params[:friend_id])
    @group = Group.find(params[:group_id])

    @usergroup = UserGroup.new(user: @friend, group: @group, status: "invited")
    authorize @usergroup
    
    if @usergroup.save
      redirect_to groups_path
    else 
      render :new
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
