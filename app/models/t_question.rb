class TQuestion < ApplicationRecord
  enum q_type: {backend: 0, frontend: 1, fullstack: 2}
  has_many :user_t_questions 
  has_many :users, through: :user_t_questions
end
