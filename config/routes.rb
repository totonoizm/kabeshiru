Rails.application.routes.draw do
  root 'gyms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :edit, :update] do
    resources :comments
    member do
      get "quit"
      patch "withdraw"
    end
  end

  resources :comments

  resources :gyms do
    resources :comments
    resource :clips, only: [:create, :destroy]
    collection do
      get :search
    end
  end
end