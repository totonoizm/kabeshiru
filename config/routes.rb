Rails.application.routes.draw do
  root 'gyms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]
    member do
      get "quit"
      patch "withdraw"
    end
  end

  resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]

  resources :gyms do
    resources :comments, only: [:index, :show, :edit, :update, :create, :destroy]
    resource :clips, only: [:create, :destroy]
    collection do
      get :search
    end
  end
end