Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "about", to: "pages#about"


  get "contactus", to: "pages#contactus"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :books, only: %i[index show] do
    resources :bookmarks, only: %i[create]
  end

  resources :users, only: [:show]
  resources :lists, except: %i[edit update] do
    resources :reviews, only: %i[new create]
  end
end
