class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = Offer.find(params[:offer_id])
    @booking.save!
    redirect_to offer_path(@booking.offer)
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date)
  end
end
