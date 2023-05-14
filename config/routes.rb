Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'top_pages#top'

  resources :users, only: %i[new create]
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
