class Toppage < ApplicationRecord
    belongs_to :user
    
    validates :best, precense: true, length: { maximum: 255 }
    validates :race, precense: true, length: { maximum: 255 }
    validates :target, precense: true, length: { maximum: 255 }
end