class GymsController < ApplicationController

    def index
        @gyms = Gym.all
    end
    
    def new
        @gym = Gym.new
    end
    
    def create
        @gym = Gym.new(Gym_params)
        @gym.user_id = current_user.id
        if @gym.save
            redirect_to gym_pas(@gym.id)
        else
            @gyms = gym.all
            render 'index'
        end
    end
    
    
    def edit
        @gym = Gym.find(params[:id])
        

    end
    
    def update
    
        
    end
    
    def show
    
        
    end
    
    def destroy
        
    end
    
end
