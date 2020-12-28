class ClipsController < ApplicationController
    
    def create
        @gym = Gym.find(params[:gym_id])
        clip = @gym.clips.new(user_id: current_user.id)
        clip.save
        redirect_to request.referer
    end
    
    def destroy
        @gym = Gym.find(params[:gym_id])
        clip = @gym.clips.find_by(user_id: current_user.id)
        clip.destroy
        redirect_to request.referer
    end
end
