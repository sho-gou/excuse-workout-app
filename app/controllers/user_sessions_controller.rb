class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    # トップページでログインフォームを表示するため、
    # ログイン画面単体へのアクセス時はトップページへリダイレクトするか、
    # もしくはトップページをレンダリングします
    render "static_pages/top"
  end

  def create
    # 1. 入力チェック（空ならトップページへ戻す）
    if params[:email].blank? || params[:password].blank?
      flash.now[:alert] = "必要な項目を入力してください"
      render "static_pages/top", status: :unprocessable_entity
      return
    end

    # 2. 認証処理
    @user = login(params[:email], params[:password])

    if @user
      # ログイン成功
      redirect_to survival_logs_path, notice: "ログインしました"
    else
      # 3. 認証失敗（トップページへ戻す）
      flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません"
      render "static_pages/top", status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "ログアウトしました"
  end
end
