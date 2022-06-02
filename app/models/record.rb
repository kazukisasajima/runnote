class Record < ApplicationRecord
  belongs_to :user
  
  validates :train, presence: true
  validates :result, presence: true
  validates :review, presence: true
  validates :start_time, presence: true
end
