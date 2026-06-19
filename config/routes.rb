Rails.application.routes.draw do
  # アプリの玄関（ここがログインフォームを兼ねる）
  root "static_pages#top"

  # ユーザー認証・登録関連
  get "signup", to: "users#new"
  post "users", to: "users#create"

  # セッション管理（ログイン処理・ログアウト）
  get 'login', to: 'user_sessions#new'
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # ログイン専用ページ(get "login")は不要なので削除！

  # プロフィール管理
  resource :profile, only: %i[show edit update]

  # 生存ログ関連
  resources :survival_logs, only: %i[index create destroy] do
    collection do
      get :calendar
    end
  end

  # Rails標準の設定
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
