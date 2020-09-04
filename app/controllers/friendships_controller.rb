class FriendshipsController < ApplicationController
  def index
    @user = User.find(params[:profile_id])
    @friends = policy_scope(Friendship)
    @friends = @user.friends.order(:points)
  end
end
