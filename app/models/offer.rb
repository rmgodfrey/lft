class Offer < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :topic, presence: true
  validates :description, presence: true
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :topic, :description ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
