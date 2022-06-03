class Review < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :content, presence: true, length: { minimum: 20}
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
