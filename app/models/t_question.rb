class TQuestion < ApplicationRecord
  has_many :user_t_questions 
  has_many :users, through: :user_t_questions
end
