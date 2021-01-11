class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:destroy, :index]

  def index
    @users = User.page(params[:page]).per(20).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @clip_gyms = @user.clip_gyms
    @comments = @user.comments.page(params[:page])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),flash: {success:  '編集に成功しました'}
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(current_user.id),flash: {success:  '編集に成功しました'}
    end
  end

  def quit
    @user = User.find(current_user.id)
  end

  def withdraw # 退会処理
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to new_user_session_path,flash[:notice] = "ご利用ありがとうございました"

  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path,flash[:notice] = "ユーザー情報を削除しました"
  end
  private

  # ホームジム変更用にstrongparamsを記載する
  # def gym_params
  # end

  # ユーザー情報update

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
