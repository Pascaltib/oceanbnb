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
        info_window: render_to_string(partial: "info_window", locals: { yacht: yacht }),
      }
    end
    @location_marker = [{ lat: @yacht.latitude,
                          lng: @yacht.longitude }]
  end

  def index
    if params[:query].present?
      ##pg search
      sql_query = "yachts.name ILIKE :query \
        OR yachts.description ILIKE :query \
        OR yachts.location ILIKE :query \
      "
      @yachts = Yacht.where(sql_query, query: "%#{params[:query]}%")

      @markers = @yachts.geocoded.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude,
        info_window: render_to_string(partial: "info_window", locals: { yacht: yacht })
      }
      end

      @text_input = params[:query]
      if @text_input.match?(/(wifi|restaurant|pool|jacuzzi)/i)
        @markers = Yacht.all.geocoded.map do |yacht|
        {
        lat: yacht.latitude,
        lng: yacht.longitude,
        info_window: render_to_string(partial: "info_window", locals: { yacht: yacht })
        }
        end
        case @text_input
        when "wifi"
          ammenities = Ammenity.all.select do |element|
            element.wifi
          end
        when "restaurant"
          ammenities = Ammenity.all.select do |element|
            element.restaurant
          end
        when "pool"
          ammenities = Ammenity.all.select do |element|
            element.pool
          end
        when "jacuzzi"
          ammenities = Ammenity.all.select do |element|
            element.jacuzzi
          end
        end
        @yachts = []
        Yacht.all.each do |x|
          ammenities.each do |y|
            if x.id == y.yacht_id
              @yachts << x
            end
          end
        end
      end
    else
      @yachts = Yacht.all
    end

  end
end
