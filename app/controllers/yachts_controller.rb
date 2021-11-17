class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @yacht = Yacht.find(params[:id])
    @booking = Booking.new
    @user = current_user
    @yachts = Yacht.all
    @markers = @yachts.geocoded.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude,
        info_window: render_to_string(partial: "info_window", locals: { yacht: yacht })
      }
    end
  end

  def index
    @yachts = Yacht.all
  end
end
