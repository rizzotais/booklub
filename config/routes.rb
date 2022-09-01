Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "contactus", to: "pages#contactus"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :books, only: %i[index show]
  resources :users, only: [:show]
end
