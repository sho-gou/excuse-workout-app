Rails.application.routes.draw do
  # ユーザー認証・登録関連
  get "signup", to: "users#new"
  post "users", to: "users#create"
  resources :user_sessions, only: %i[new create destroy]
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # プロフィール管理
  resource :profile, only: %i[show edit update]

  # 生存ログ関連（index, createと専用カレンダーページ）
  resources :survival_logs, only: %i[index create destroy] do
    collection do
      get :calendar # カレンダー表示用アクションを追加
    end
  end

  # アプリケーションのトップページを生存報告一覧に設定
  root "survival_logs#index"

  # Rails標準のヘルスチェック・PWA設定
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
