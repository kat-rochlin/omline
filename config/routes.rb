Rails.application.routes.draw do

  get 'teachers_certifications/create'
  get 'teachers_certifications/destroy'
  get 'teachers/new_profile'
  get 'teachers/save_profile'
  get 'users/complete_profile'
  get 'users/update_profile'
  get 'messages/index'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'

  get 'hubs/index'
  get 'hubs/show'
  get "profile/:id", to: "pages#profile", as: "profile"
  get "complete_profile", to: "users#complete_profile", as: "complete_profile"
  patch "complete_profile", to: "users#complete_profile"
  patch "update_profile", to: "users#update_profile", as: "update_profile"
  get "new_profile", to: "teachers#new_profile", as: "new_teacher_profile"
  post "save", to: "teachers#save_profile", as: "save_teacher_profile"
  post "friend/:id", to: "pages#request_friend", as: "request_friend"
  post "friends/:id", to: "pages#accept_friend", as: "accept_friend"
  delete "friend/:id", to: "pages#remove_friend", as: "remove_friend"
  delete "friend/:id", to: "pages#decline_request", as: "decline_request"
  get "dashboard", to: "pages#dashboard", as: 'dashboard'
  get "new_hub", to: "pages#current_hub"
  get "add_tag", to: "pages#add_tag"
  delete "remove_tag", to: "pages#remove_tag"

  resources :user_connections do
    resources :messages, only: [:index, :create,:new]
  end

  resources :events, only: [:edit, :destroy, :update, :show] do
    resources :event_bookings, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hubs, only: [:index, :show] do
    resources :events, only: :create
  end


  resources :teacher_certifications, only: [:create, :destroy]
  resources :teacher_teaching_styles, only: [:create, :destroy]
  resources :teacher_experiences, only: [:create, :update, :destroy]


end
