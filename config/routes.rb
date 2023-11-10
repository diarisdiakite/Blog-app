Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      member do
        post 'like'
        post 'comment'
      end
      resources :comments, only: [:destroy]
    end
  end
  
  # Defines the root path route ("/")
  root to: 'users#index'


  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          # resources :likes
        end
      end
    end
  end
end
