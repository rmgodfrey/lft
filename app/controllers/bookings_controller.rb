class BookingsController < ApplicationController
  def index
    if params[:time] == "future"
      date_range = Time.now.utc..
    else
      date_range = ...Time.now.utc
    end
    bookings = Booking.where(user: current_user, starting_date: date_range)
    @bookings = bookings.sort_by do |booking|
      date = booking.starting_date.to_i
      params[:time] == "future" ? date : -date
    end
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.offer = @offer

    set_booking_time(@offer)

    if @booking.save
      redirect_to bookings_path("future") if @booking.save
    else
      render 'offers/show'
    end
    # TODO: re-render page if booking doesn't save. Easier said than done;
    # not sure how to do this when the page belongs to another controller.
  end

  private

  def set_booking_time(offer)
    booking_time = parse(params[:booking][:starting_date])
    if offer.timezone && booking_time
      lesson_timezone = offer.fetch_timezone
      @booking.starting_date = lesson_timezone.local_to_utc(booking_time)
    else
      @booking.starting_date = booking_time
    end
  end

  # def booking_params
  #   params.require(:booking).permit(:starting_date)
  # end

  def parse(time_string)
    return if time_string == ""

    time_string += ":00Z"
    Time.iso8601(time_string)
  end
end
