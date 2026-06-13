class UserSessionsController < ApplicationController
  def new
  end

  def create
    # ユーザー認証してログインする
    @user = login(params[:email], params[:password])
    if @user
      # ログイン成功
      redirect_to root_path, notice: 'ログインしました'
    else
      # ログイン失敗
      flash.now[:alert] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # ログアウトする
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
