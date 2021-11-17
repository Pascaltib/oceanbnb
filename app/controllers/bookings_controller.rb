class BookingsController < ApplicationController
  def create
    @user = current_user
    if @user
      @yacht = Yacht.find(params[:yacht_id])
      Booking.create!(
        { user: @user, yacht: @yacht, starts_at: params[:booking][:starts_at], ends_at: params[:booking][:ends_at] }
      )
      redirect_to profile_path
    else
      redirect_to users__path
    end
  end

  def accept

  end

  def reject

  end
end
