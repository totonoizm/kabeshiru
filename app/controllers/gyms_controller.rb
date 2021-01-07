class GymsController < ApplicationController

    def index
        # @random = Gym.order("RAND()").limit(5)
        @gyms = Gym.page(params[:page]).per(20).reverse_order
        #20件表示
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
        @comments = @gym.comments.page(params[:page]).per(5)
    end
    
    def destroy
        @gym = Gym.find(params[:id])
        @gym.destroy
        redirect_to gyms_path
    end
    
    
    private
    def gym_params
        params.require(:gym).permit(:name, :introduction, :tel, :gym_image,
                                    :address, :postcode, :url, :open_time, :price, :holiday,
                                    :access, :latitude, :longitude)
    end
end
