class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @yacht = Yacht.find(params[:id])
    @booking = Booking.new
    @user = current_user
    @yachts = Yacht.all
    @ammenities = Ammenity.all.where(yacht: @yacht)[0]

    @markers = @yachts.geocoded.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude,
        info_window: render_to_string(partial: "info_window", locals: { yacht: yacht })
      }
    end
  end

  def index
    if params[:query].present?
      ##pg search
      sql_query = "yachts.name ILIKE :query \
        OR yachts.description ILIKE :query \
        OR yachts.location ILIKE :query \
      "
      @yachts = Yacht.where(sql_query, query: "%#{params[:query]}%")
      # @yachts = Yacht.global_search(params[:query])
    else
      @yachts = Yacht.all
    end
  end
end
