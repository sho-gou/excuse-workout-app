class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  # 新規登録画面を表示するアクション
  def new
    @user = User.new
  end

  # フォームから送られてきたデータでユーザーを登録するアクション
  def create
    @user = User.new(user_params)
    # データが保存できたかチェック
    if @user.save
      # 成功したらトップページへリダイレクト
      redirect_to root_path, notice: "ユーザー登録が完了しました"
    else
      # 失敗したら登録画面を再表示（エラーメッセージを出す）
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  private

  # フォームから受け取るデータに制限をかける（セキュリティ対策）
  def user_params
    # :email, :password, :password_confirmation だけを受け取る
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
