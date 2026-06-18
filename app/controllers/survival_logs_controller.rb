class SurvivalLogsController < ApplicationController
  before_action :require_login

  # 生存報告入力ページ
  def index
    @survival_logs = current_user.survival_logs.order(created_at: :desc)
    @survival_log = SurvivalLog.new
    @selected_date = params[:reported_on] || Date.today
  end

  # カレンダー表示用
  def calendar
    @survival_logs = current_user.survival_logs
  end

  # 投稿処理
  def create
    # 目標未設定チェック
    if current_user.profile&.fitness_goal.blank?
      redirect_to survival_logs_path, alert: "やる事が設定されていません。プロフィールから設定してください。"
      return
    end

    # ログオブジェクトの構築
    @survival_log = current_user.survival_logs.build(survival_log_params)

    # 日付のセット（フォームから受け取ったもの、なければ今日）
    target_date = params[:survival_log][:reported_on].present? ? Date.parse(params[:survival_log][:reported_on]) : Date.today

    # 1日1回の重複投稿チェック
    if current_user.survival_logs.where(reported_on: target_date).exists?
      redirect_to survival_logs_path, alert: "#{target_date}の報告は既に完了しています。"
      return
    end

    @survival_log.reported_on = target_date

    # 「実行！」(ステータス1)の場合は自動的に目標を保存
    if @survival_log.report_status.to_i == 1
      @survival_log.todo = current_user.profile.fitness_goal
    end

    # DB保存処理
    if @survival_log.save
      redirect_to calendar_survival_logs_path, notice: "#{target_date}の生存報告を記録しました"
    else
      redirect_to survival_logs_path, alert: "記録に失敗しました..."
    end
  end

  def destroy
    @survival_log = current_user.survival_logs.find(params[:id])
    @survival_log.destroy
    redirect_to calendar_survival_logs_path, notice: "ログを削除しました"
  end

  private

  def survival_log_params
    params.require(:survival_log).permit(:report_status, :excuse_id, :todo, :reported_on)
  end
end
