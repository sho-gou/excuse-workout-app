class User < ApplicationRecord
  # パスワード暗号化、確認用フィールドの照合
  authenticates_with_sorcery!

  # ユーザーはプロフィールを１つだけもつ
  has_one :profile, dependent: :destroy
  # ユーザーは複数の生存報告をもつ
  has_many :survival_logs, dependent: :destroy

  # バリデーションの設定
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
end
