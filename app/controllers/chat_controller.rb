class ChatController < ApplicationController
  before_action :chats_maker

  def show
    @master = User.find(params[:user_id])
    @new_chat = Chat.new
  end

  def update
    @master = User.find(params[:user_id])
    Chat.create(message: params[:chat][:message], user_id: current_user.id, room_id: @room_num)
    @new_chat = Chat.new
    render 'chat_add'
  end

  private

    def chat_params
      params.require(:chat).permit(:message)
    end
    # 質問 この辺の記述が冗長過ぎる？
    def chats_maker
      trigger = true
      if my_user_room = UserRoom.where(user_id: current_user.id)
        if you_user_room = UserRoom.where(user_id: params[:user_id])
        @room_num = (my_user_room.pluck(:room_id) & you_user_room.pluck(:room_id)).join.to_i
        unless @room_num == 0
          @chats = Chat.where(room_id: @room_num)
          trigger = false
          end
        end
      end
      if trigger
        fast_contact
      end
    end

    def fast_contact
      room = Room.create
      UserRoom.create(room_id: room.id, user_id: params[:user_id])
      UserRoom.create(room_id: room.id, user_id: current_user.id)
      chats_maker
    end

end
