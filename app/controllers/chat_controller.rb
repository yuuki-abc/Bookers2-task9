class ChatController < ApplicationController

  def show
    @master = User.find(params[:user_id])
    @new_chat = Chat.new
    chats_maker
  end


  def update
    @new_chat = Chat.new
    chats_maker
    Chat.create(message: params[:chat][:message], user_id: current_user.id, room_id: @my_user_room.room_id)
    render 'chat_add'
  end

  private

    def chat_params
      params.require(:chat).permit(:message)
    end

    def chats_maker
      trigger = true
      if !!@my_user_room = UserRoom.find_by(user_id: current_user.id) # 少なくとも誰かとチャットした事がある場合
        if !!@you_user_room = UserRoom.find_by(user_id: params[:user_id]) # 少なくとも相手が誰かとチャットした事がある場合
          if !!@my_user_room = UserRoom.find_by(room_id: @you_user_room.room_id) # 相手と会話した事があったなら
            room = @my_user_room.room_id & @you_user_room.room_id
            @chats = Chat.where(room_id: room)
            trigger = false
            puts "\n\n\nチャット経験者\n\n\n"
          end
        end
      end
      if trigger
        puts "\n\n\n初めての人\n\n\n"
        @room = Room.create
        @you_user_room = UserRoom.create(room_id: @room.id, user_id: params[:user_id])
        @my_user_room = UserRoom.create(room_id: @room.id, user_id: current_user.id)
      end
    end

end
