Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users/:id", to "users#show"
  
  resources :users do
    resources :posts , only: [:index, :new, :create, :show] do
      member do
        post 'like'
        post 'comment'
      end
    end
  end
  
  # Defines the root path route ("/")
  root "users#index"
end
