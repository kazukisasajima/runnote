class Project < ApplicationRecord
  belongs_to :user  
  
  validates :plan, presence: true, length: { maximum: 255 }
  
end
