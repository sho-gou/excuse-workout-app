class ApplicationController < ActionController::Base
  # どのページも基本はログインが必要と設定する
  before_action :require_login

  # 必要に応じてこれらを有効化（Railsの最近の標準）
  allow_browser versions: :modern

  private

  # ログインしていない時のリダイレクト先を定義
  def not_authenticated
    flash[:warning] = "ログインしてください"
    redirect_to root_path
  end
end
