class UsersController < ApplicationController
    
    
    def index
    end
    
    def show
        @user = User.find(params[:id])
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
    
    private
    #ホームジム変更用にstrongparamsを記載する
    # def gym_params
    #end
    
    #ユーザー情報update
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
end
