class Offer < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  validates :topic, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :global_search,
    against: [ :topic, :description ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
