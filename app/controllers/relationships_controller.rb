class RelationshipsController < ApplicationController
  before_action :authenticate_user!
      
  def create
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    render 'create'
  end
  
  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
    render 'destroy'
  end
end
