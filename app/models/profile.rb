class Profile < ApplicationRecord
  belongs_to :user

  # 目標とメニューが空での保存を禁止
  validates :fitness_goal, presence: true, length: { maximum: 50 }
  validates :tiny_menu, presence: true, length: { maximum: 50 }
end
