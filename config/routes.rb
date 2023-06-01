Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'top_pages#top'

  resources :users, only: %i[new create destroy]
  resource :profile, only: %i[show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :okogoto_images, only: %i[new create]
  resources :posts do
    resources :likes, only: %i[create destroy]
    member do
      get 'download'
    end
  end
end
