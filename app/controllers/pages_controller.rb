class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @users = User.all
    @user = current_user
# added to access the yatch to profile
    @user_bookings = Booking.all.select { |booking| booking.user_id == @user.id}
    # @user.yachts = date_reserved??
  end
end
