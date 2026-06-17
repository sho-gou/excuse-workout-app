class SurvivalLogsController < ApplicationController
  # indexとcreateアクション実行前にログインしているか確認
  before_action :require_login

  # 一覧表示用のメソッド
  def index
    # 1. 現在のユーザーに紐付くログを、作成日時の新しい順に全件取得
    @survival_logs = current_user.survival_logs.order(created_at: :desc)
    # 2. 新規投稿用の空のログオブジェクトを生成（フォームで利用するため）
    @survival_log = SurvivalLog.new
  end

  # データ作成用のメソッド
  def create
    # プロフィールが存在し、かつ fitness_goal が設定されているか確認
    if current_user.profile&.fitness_goal.blank?
    redirect_to survival_logs_path, alert: "やる事が設定されていません。プロフィールから設定してください。"
    return
    end

    # 2. ログイン中のユーザーのログとして、受け取ったパラメータでオブジェクトを構築
    @survival_log = current_user.survival_logs.build(survival_log_params)

    # 【追加】もし「実行！」ならプロフィールから目標を保存
    # ※ report_status は、フォームから送られてくるパラメータ名に合わせてください
    if @survival_log.report_status == "実行！" 
      @survival_log.todo = current_user.profile.fitness_goal
    end

    # 3. 報告日は自動的に「今日」の日付を設定
    @survival_log.reported_on = Date.today

    # 4. データをデータベースに保存
    if @survival_log.save
      # 5. 成功した場合：一覧画面にリダイレクトし、通知を表示
      redirect_to survival_logs_path, notice: "生存報告を記録しました"
    else
      # 6. 失敗した場合：一覧画面に戻し、エラーメッセージを表示
      redirect_to survival_logs_path, alert: "記録に失敗しました"
    end
  end

  private

  # 7. 送られてくるデータのうち、保存を許可する項目を定義（セキュリティ対策）
  def survival_log_params
    params.require(:survival_log).permit(:report_status, :excuse_id, :todo)
  end
end
