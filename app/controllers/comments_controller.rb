class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
    @gym = Gym.find(@comment.gym_id)
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      render 'edit'
    else
      redirect_to comment_path(@comment.id)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment.id),flash: {success: '編集に成功しました！'}
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
    @comments = @gym.comments.order(created_at: :desc).page(params[:page])
    if @comment.save
      render 'create'
    else
      render 'error'
    end
  end

  def destroy
    if params[:gym_id].present?
      @gym = Gym.find(params[:gym_id])
      comment = @gym.comments.find(params[:id])
      comment.destroy
      @comments = @gym.comments.order(created_at: :desc).page(params[:page])
    else
      @user = User.find(params[:user_id])
      comment = @user.comments.find(params[:id])
      comment.destroy
      @comments = @user.comments.order(created_at: :desc).page(params[:page])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :comment_image)
  end
end
