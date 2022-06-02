class BookingsController < ApplicationController

  def index
    if params[:time] == "future"
      date_range = Time.zone.now...
    else
      date_range = ...Time.zone.now
    end
    @bookings = Booking.where(user: current_user, starting_date: date_range)
  end

  def new
    @booking = Booking.new
  end

  def create
    # time_zone = ActiveSupport::TimeZone::MAPPING[current_user.time_zone]
    # tz = TZInfo::Timezone.get(time_zone)
    # time = Time.iso8601(params["booking"]["starting_date"] + ":00")
    # year, month, day, hour, min =
    #   time.year, time.month, time.day, time.hour, time.min
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = Offer.find(params[:offer_id])
    raise
    @booking.save!
    redirect_to bookings_path("future")
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date)
  end
end
