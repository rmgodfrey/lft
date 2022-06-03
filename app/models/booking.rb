class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :starting_date, presence: true
end
