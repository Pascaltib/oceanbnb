class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @yacht1 = Yacht.all.sample
    @yacht2 = Yacht.all.sample

    @user = current_user
    @user_bookings = Booking.all
  end

  def profile
    @users = User.all
    @yachts = Yacht.all
    @user = current_user
    # added to access the yatch to profile
    @user_bookings = Booking.all.select { |booking| booking.user_id == @user.id }
    if Booking.last
      @image_url = Yacht.find(Booking.last.yacht_id).image_url

    else
      @image_url = Yacht.all.sample.image_url
    end
    # @user.yachts = date_reserved??
  end
end
