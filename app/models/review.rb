class Review < ApplicationRecord
  belongs_to :offer
  validates :topic, presence: true
  validates :description, presence: true
end
