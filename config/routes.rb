Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users/:id", to "users#show"
  
  resources :users, only: [:index, :show] do
    resources :posts , only: [:index, :show]
  end
  
  # Defines the root path route ("/")
  root "users#index"
end
