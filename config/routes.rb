Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: 'pages#home'

  get 'hubs/index'
  get 'hubs/show'
  get "profile/:id", to: "pages#profile"
  post "friend/:id", to: "pages#request_friend", as: "request_friend"
  post "friends/:id", to: "pages#accept_friend", as: "accept_friend"
  delete "friend/:id", to: "pages#remove_friend", as: "remove_friend"
  get "dashboard", to: "pages#dashboard"
  get "new_hub", to: "pages#current_hub"

  resources :user_connections, only: [:new, :create, :index, :show, :destroy] do
    resources :messages, only: [ :index, :create ]
  end

  resources :events, only: [:edit, :destroy, :update, :show] do
    resources :event_bookings, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hubs, only: [:index, :show] do
    resources :events, only: :create
  end
end
