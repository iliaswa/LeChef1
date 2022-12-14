Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chefs do
    resources :bookings, only: [:index, :show, :new, :create]
  end
  resources :bookings, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
