class UserTQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :t_question
end
