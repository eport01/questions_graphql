class UserTQuestion < ApplicationRecord
  # enum status: {active: 0, inactive: 1, favorited: 2}
  belongs_to :user
  belongs_to :t_question
end
