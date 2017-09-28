class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :results
  validates :name, presence: true
end
