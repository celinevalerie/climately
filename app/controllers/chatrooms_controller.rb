class ChatroomsController < ApplicationController  
  def show
    @group = Group.find(params[:group_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
