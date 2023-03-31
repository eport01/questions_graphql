class User < ApplicationRecord
  has_many :user_b_questions
  has_many :b_questions, through: :user_b_questions
  has_many :user_t_questions
  has_many :t_questions, through: :user_t_questions

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true 
  validates :token, presence: true
  validates :uid, presence: true 
  # has_secure_password
end
