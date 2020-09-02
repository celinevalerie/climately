class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
        )
        redirect_to group_chatroom_path(@group, @chatroom, anchor: "message-#{@message.id}")
    else
        render "chatrooms/show"
    end
  end
  


  private
  def message_params
    params.require(:message).permit(:content, :group_id, :chatroom_id)
  end
end
