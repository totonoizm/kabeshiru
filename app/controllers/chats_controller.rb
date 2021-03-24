class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user


    def show
        @user = User.find(params[:id]) # メッセージ相手を取得
        if @user.id != current_user.id # chatroomへの制限
            rooms = current_user.user_rooms.pluck(:room_id)
            user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
            
            if user_rooms.nil?
                @room = Room.new
                @room.save
                UserRoom.create(user_id: current_user.id, room_id: @room.id)
                UserRoom.create(user_id: @user.id, room_id: @room.id)
            else
                @room = user_rooms.room
            end
            @chats = @room.chats
            @chat = Chat.new(room_id: @room.id)
        else
            redirect_to root_path
        end
    end
    
    def create
        @chat = current_user.chats.new(chat_params)
        @chat.save
    end
    
    def check_user
        if @user == current_user
         redirect_to root_path
        end
    end
    
    private
    
    def chat_params
        params.require(:chat).permit(:message, :room_id)
    end
end
