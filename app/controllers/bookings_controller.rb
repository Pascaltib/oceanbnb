class BookingsController < ApplicationController
  def create
    @user = current_user
    if @user
      @yacht = Yacht.find(params[:yacht_id])

      booking = Booking.new(booking_params)
      booking.user = @user
      booking.yacht = @yacht
      booking.save

      redirect_to profile_path
    else
      redirect_to users__path
    end
  end

  def accept
    booking = Booking.find(params[:id])
    booking.status = "Accepted"
    booking.save!
    redirect_to "/"
  end

  def reject
    booking = Booking.find(params[:id])
    booking.status = "Rejected"
    booking.save!
    redirect_to "/"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date,:end_date)

  end
end
