Rails.application.routes.draw do
  root 'gyms#index'
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :relationships, only: [:create, :destroy]
    resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]
    member do
      get :following, :followers
      get "quit"
      patch "withdraw"
    end
  end

  resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]
  
  resources :contacts, only: [:new, :create,]
  
  resources :gyms do
    resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]
    resource :clips, only: [:create, :destroy]
    collection do
      get :search
      get :about
    end
  end
end
