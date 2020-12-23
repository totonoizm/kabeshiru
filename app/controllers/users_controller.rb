class UsersController < ApplicationController
    
    
    def index
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
    end
    
    def edit
        @user = User.find(params[:id])
        if @user == current_user
            render 'edit'
        else
            redirect_to user_path(current_user.id)
        end
    end
end
