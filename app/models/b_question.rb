class BQuestion < ApplicationRecord
  has_many :user_b_questions 
  has_many :users, through: :user_b_questions
end
