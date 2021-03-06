class ChatController < ApplicationController
  before_action :chats_maker

  def show
    @master = User.find(params[:user_id])
    @new_chat = Chat.new
  end

  def update
    Chat.create(message: params[:chat][:message], user_id: current_user.id, room_id: @room)
    @new_chat = Chat.new
    render 'chat_add'
  end

  private

    def chat_params
      params.require(:chat).permit(:message)
    end

    def chats_maker
      trigger = true
      if UserRoom.find_by(user_id: current_user.id) # 誰かとチャットした事がある?
        if you_user_room = UserRoom.find_by(user_id: params[:user_id]) # 相手が誰かとチャットした事がある?
          if my_user_room = UserRoom.find_by(room_id: you_user_room.room_id) # 相手と会話した事がある?
            @room = my_user_room.room_id & you_user_room.room_id
            @chats = Chat.where(room_id: @room)
            trigger = false
          end
        end
      end
      if trigger
        @room = Room.create
        UserRoom.create(room_id: @room.id, user_id: params[:user_id])
        UserRoom.create(room_id: @room.id, user_id: current_user.id)
      end
    end

end
