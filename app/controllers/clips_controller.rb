class ClipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @gym = Gym.find(params[:gym_id])
    clip = @gym.clips.new(user_id: current_user.id)
    clip.save
  end

  def destroy
    @gym = Gym.find(params[:gym_id])
    clip = @gym.clips.find_by(user_id: current_user.id)
    clip.destroy
  end
end
