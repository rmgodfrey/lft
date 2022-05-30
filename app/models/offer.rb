class Offer < ApplicationRecord
  belongs_to :user
  validates :topic, presence: true
  validates :description, presence: true
end
