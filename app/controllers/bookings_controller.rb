class BookingsController < ApplicationController

  def index
    # Time.zone = current_user.time_zone
    if params[:time] == "future"
      date_range = Time.zone.now...
    else
      date_range = ...Time.zone.now
    end
    @bookings = Booking.where(user: current_user, starting_date: date_range)
  end

  def new
    Time.zone = current_user.time_zone
    @booking = Booking.new
  end

  def create
    raise
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
