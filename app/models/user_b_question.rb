class UserBQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :b_question
end
