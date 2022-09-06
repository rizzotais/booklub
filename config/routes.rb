Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "about", to: "pages#about"


  get "contactus", to: "pages#contactus"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :books, only: %i[index show ] do
    resources :bookmarks, only: %i[create]
    resources :reviews, only: %i[new create]
  end

  resources :bookmarks, only: %i[destroy]

  resources :users, only: [:show]
  resources :lists, except: %i[edit update]

  resources :chatrooms, only: :show
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end



  resources :lists, except: %i[edit update]

  resources :users, only: [:show] do
    resources :readings, only: %i[create update]
  end
  resources :readings, only: %i[destroy]
end
