class UsersController < ApplicationController
    
    
    def index
    end
    
    def show
        @user = User.find(params[:id])
        @clip_gyms = @user.clip_gyms
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            render 'edit'
        end
    end
    
    def edit
        @user = User.find(params[:id])
        if @user == current_user
            render 'edit'
        else
            redirect_to user_path(current_user.id)
        end
    end
    
    def quit
        @user = User.find(current_user.id)
    end
    
    def withdraw #退会処理
        @user = User.find(current_user.id)
        @user.update(is_deleted: true)
        reset_session
        flash[:notice] = "Thank you for the good rating. We hope to see you again."
        redirect_to new_user_session_path
    end
    
    private
    #ホームジム変更用にstrongparamsを記載する
    # def gym_params
    #end
    
    #ユーザー情報update
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
end
