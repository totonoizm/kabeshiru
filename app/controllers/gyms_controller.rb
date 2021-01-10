class GymsController < ApplicationController
      before_action :authenticate_user!, only: [:new, :create, :edit, :update, :show]
      before_action :admin_user, only: :destroy
    
    def index
        # @random = Gym.order("RAND()").limit(5)
        @gyms = Gym.page(params[:page]).per(9).reverse_order
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
        @comments = @gym.comments.order(created_at: :desc).page(params[:page])
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
