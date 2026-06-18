class SurvivalLog < ApplicationRecord
  belongs_to :user
  belongs_to :excuse, optional: true

  # 同一日付、同一ユーザーの投稿を重複させないためのバリデーション
  validates :reported_on, uniqueness: { scope: :user_id, message: "は1日1回までです" }

  # simple_calendarが日付を判断するために使う必須メソッド
  def start_time
    self.reported_on
  end
end
