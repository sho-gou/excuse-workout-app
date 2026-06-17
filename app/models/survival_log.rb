class SurvivalLog < ApplicationRecord
  belongs_to :user
  belongs_to :excuse, optional: true
end
