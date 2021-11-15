class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @yacht = Yacht.find(params[:id])
    @reviews = Review.new
  end

  private
  def yacht_params
    params.require(:yacht).permit(:name, :description, :capacity, :location, :image_url)
  end
end
