Rails.application.routes.draw do
  # ユーザー登録用
  get "signup", to: "users#new"
  post "users", to: "users#create"

  # ログイン関係
  resources :user_sessions, only: %i[new create destroy]
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # プロフィール編集用
  resource :profile, only: %i[show edit update]

  # 生存ログ（複数形に変更）
  resources :survival_logs, only: %i[index create]

  # トップページを生存報告一覧にする
  root "survival_logs#index"

  # 以下、Rails標準の記述
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
