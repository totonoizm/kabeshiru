Rails.application.routes.draw do
  root 'gyms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users
  #   resources :comments
  # end
  resources :comments

  resources :gyms do
    collection do
      get :search
    end
    resources :comments
  end
end