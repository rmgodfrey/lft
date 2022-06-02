class BookingsController < ApplicationController

  def index
    if params[:time] == "future"
      date_range = Time.zone.now..
    else
      date_range = ...Time.zone.now
    end
    @bookings = Booking.where(user: current_user, starting_date: date_range)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = Offer.find(params[:offer_id])
    @booking.save!
    redirect_to bookings_path("future")
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date)
  end
end
