class User < ApplicationRecord
    # パスワード暗号化、確認用フィールドの照合
    authenticates_with_sorcery!

    # バリデーションの設定
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
end
