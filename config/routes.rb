Rails.application.routes.draw do
  get 'hubs/index'
  get 'hubs/show'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:edit, :destroy, :create, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hubs, only: [:index, :show]
end
