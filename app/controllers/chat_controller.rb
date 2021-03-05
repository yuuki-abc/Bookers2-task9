class ChatController < ApplicationController

  def show
    @master = User.find(params[:user_id])
    @chat = Chat.new
    @chats = Chat.all
  end

  def update
    @new_chat = Chat.new

    unless UserRoom.find_by(user_id: params[:id])
      @room = Room.create
      @user_room = UserRoom.create(room_id: @room.id, user_id: params[:user_id])
    end

    @user_room = UserRoom.find_by(user_id: params[:id])
    @room = Room.find(@user_room.room_id)

    @chat = Chat.create(message: chat_params[:message], room_id: @room.id, user_id: current_user.id)
    # binding.pry
    # a == 'aaa'

    @chats = Chat.where(room_id: @room.id)

    render 'chat_add'

  end

  private

    def chat_params
      # params.permit(:message)
      params.require(:chat).permit(:message)
    end

end
