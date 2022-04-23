class Workout < ApplicationRecord
    
    validates :task, presence: true, length: { maximum: 255 }
end
