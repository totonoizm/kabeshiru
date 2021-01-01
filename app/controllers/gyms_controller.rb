class GymsController < ApplicationController

    def index
        @gyms = Gym.page(params[:page]).reverse_order
        #5件表示
        @random = Gym.order("RAND()").limit(5)
    end
    
    def new
        @gym = Gym.new
    end
    
    def create
        @gym = Gym.new(gym_params)
        if @gym.save!
            redirect_to gym_path(@gym.id)
        else
            render 'new'
        end
    end
    
    def edit
        @gym = Gym.find(params[:id])
    end
    
    def update
        @gym = Gym.find(params[:id])
        if @gym.update(gym_params)
            redirect_to gym_path(@gym.id)
        else
            render 'edit'
        end
    end
    
    def show
        @gym = Gym.find(params[:id])
        @comment = Comment.new
    end
    
    def destroy
        
    end
    
    
    private
    def gym_params
        params.require(:gym).permit(:name, :introduction, :tel, :gym_image, :state,
                                    :address, :postcode, :url, :open_time, :price, :holiday,
                                    :access, :latitude, :longitude)
    end
end
