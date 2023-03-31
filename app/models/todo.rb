class Todo < ApplicationRecord
  belongs_to :user 
  validates :item, presence: true 
end