class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [ :top ]

  def top
    # ログイン済みなら、ログイン画面を表示せず一覧へ飛ばす！
    if logged_in?
      redirect_to survival_logs_path
    end
  end
end
