class FriendshipsController < ApplicationController
  def index
    @user = User.find(params[:profile_id])
    @friends = policy_scope(Friendship)
    @friends = @user.friends.order(:points)
    if params[:query].present?
      @nonfriends = User.global_search(params[:query])
    else
      @nonfriends = User.all - @friends
    end
  end


  def create
    @friend = User.find(params[:friend_id])
    @user = current_user
    @friendship = Friendship.new(friend: @friend, user: @user)
    authorize @friendship
    @friendship.save
    @friendship = Friendship.new(friend: @user, user: @friend)
    authorize @friendship
    if @friendship.save
      redirect_to profile_friendships_path(@user)
    end
  end
end
