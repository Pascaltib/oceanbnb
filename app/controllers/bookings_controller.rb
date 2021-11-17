class BookingsController < ApplicationController
  def create
    @user = current_user
    if @user
      @yacht = Yacht.find(params[:yacht_id])

      booking = Booking.new(booking_params)
      booking.user = @user
      booking.yacht = @yacht

      redirect_to profile_path
    else
      redirect_to users__path
    end
  end

  def accept

  end

  def reject

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date,:end_date)

  end
end
