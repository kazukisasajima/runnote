class Plan < ApplicationRecord
  belongs_to :user
  
  validates :menu, presence: true
  validates :time, presence: true
  validates :detail, presence: true
  validates :start_time, presence: true
end
