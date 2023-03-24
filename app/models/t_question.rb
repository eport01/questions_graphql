class TQuestion < ApplicationRecord
  # enum q_type: {backend: 1, frontend: 2, fullstack: 3}
  has_many :user_t_questions 
  has_many :users, through: :user_t_questions
end
