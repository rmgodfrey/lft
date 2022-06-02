class BookingsController < ApplicationController

  def index
    if params[:time] == "future"
      date_range = Time.now.utc..
    else
      date_range = ...Time.now.utc
    end
    @bookings = Booking.where(user: current_user, starting_date: date_range)
  end

  def create
    offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.offer = offer

    lesson_timezone = offer.fetch_timezone
    booking_time = parse(params[:booking][:starting_date])
    @booking.starting_date = lesson_timezone.local_to_utc(booking_time)

    @booking.save!
    redirect_to bookings_path("future")
  end

  private

  # def booking_params
  #   params.require(:booking).permit(:starting_date)
  # end

  def parse(time_string)
    time_string += ":00Z"
    Time.iso8601(time_string)
  end
end
