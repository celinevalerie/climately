class FriendshipsController < ApplicationController
  def index
    @navbartitle = "Friends"
    @user = User.find(params[:profile_id])
    @friends = policy_scope(Friendship)
    @friends = @user.friends.order(points: :desc)
    @friends = @friends.to_a.push(current_user)

    if params[:choice].present? 
      @choice = params[:choice]
    else
      @choice = 'add'
    end

    if params[:query].present?
      @nonfriends = User.global_search(params[:query])
    else
      @nonfriends = User.all - @friends
      @nonfriends.delete(current_user)
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
