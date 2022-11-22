class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chef
  validates :description, presence: true
end
