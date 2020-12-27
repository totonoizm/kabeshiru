class CommentsController < ApplicationController
    
    def show
        @comment = Comment.find(params[:id])
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
        @gym = Gym.find(params[:gym_id])
        comment = @gym.comments.find(params[:id])
        comment.destroy
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
