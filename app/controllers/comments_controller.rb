class CommentsController < ApplicationController
    
    def index
        @comments = Comment.page(params[:page]).per(20)
    end

    def show
        @comment = Comment.find(params[:id])
        @user = User.find(@comment.user_id)
        @gym = Gym.find(@comment.gym_id)
        # @user = User.find(params[:id]) findメソッド、paramsidの意味を学び直す
        # @gym = Gym.find(params[:id])
    end
    
    def edit
        @comment = Comment.find(params[:id])
    end
    
    def update
        @comment = Comment.find(params[:id])
        if @comment.update!(comment_params)
            redirect_to comment_path(@comment.id)
        else
            render 'edit'
        end
    end

    def create
        @gym = Gym.find(params[:gym_id])
        @comment = Comment.new(comment_params)
        @comment.gym_id = @gym.id
        @comment.user_id = current_user.id
        @comment.comment_seq = @comment.comment_seq_count
        unless @comment.save
            render 'gyms/show'
        end
    end
    
    def destroy
        if params[:gym_id].present?
            @gym = Gym.find(params[:gym_id])
            comment = @gym.comments.find(params[:id])
            comment.destroy
            @comments  = @gym.comments
        else
            @user = User.find(params[:user_id])
            comment = @user.comments.find(params[:id])
            comment.destroy
            @comments = @user.comments
        end
        
        

    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment, :comment_image)
    end
end
