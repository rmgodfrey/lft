class Offer < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :reviews
  validates :topic, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :add_timezone, if: :geocoded?
  pg_search_scope :global_search,
                  against: [ :topic, :description ],
                  associated_against: {
                    user: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def fetch_timezone
    # Returns an actual Timezone object. Compare with Offer#timezone, which
    # just returns a string representing the timezone.
    Timezone.fetch(timezone)
  end

  private

  def add_timezone
    self.timezone = Timezone.lookup(latitude, longitude)
  end
end
