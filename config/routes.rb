Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'top_pages#top'

  resources :users, only: %i[new create destroy]
  resource :profile, only: %i[show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :password_resets, only: %i[create edit update]

  resources :okogoto_images, only: %i[new create]
  resources :posts do
    resources :likes, only: %i[create destroy]
    member do
      get 'download'
    end
  end
  patch 'posts', to: 'posts#create'

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index show destroy]
    resources :posts, only: %i[index show destroy]
    resources :tags, only: %i[index create destroy]
  end

  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz")

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
