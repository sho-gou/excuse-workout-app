Rails.application.routes.draw do
  # ユーザー登録用（画面表示はGET、登録実行はPOST）
  get 'signup', to: 'users#new'
  post 'users', to: "users#create"
  root "static_pages#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # resources を使うと自動的に login_path などが生成
  resources :user_sessions, only: %i[new create destroy]

  # ログイン画面を表示するルート
  get 'login', to: 'user_sessions#new'
  # ログイン処理を行うルート
  post 'login', to: 'user_sessions#create'
  # ログアウト用のルート
  delete 'logout', to: 'user_sessions#destroy'

  # プロフィール編集用
  resource :profile, only: %i[show edit update]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"


end
