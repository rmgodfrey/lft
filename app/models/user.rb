class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_one_attached :photo
  validates :location, presence: true
  validates :name, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  after_validation :add_timezone, if: :geocoded?

  # Not very DRY, since it repeats code from `offer.rb`.
  # A use case for modules, perhaps?

  def fetch_timezone
    Timezone.fetch(timezone)
  end

  private

  def add_timezone
    self.timezone = Timezone.lookup(latitude, longitude)
  end
end
