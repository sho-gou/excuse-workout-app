class SurvivalLog < ApplicationRecord
  belongs_to :user
  belongs_to :excuse
end
