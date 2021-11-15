class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @yacht = Yacht.find(params[:id])
  end

  private

  def index
    @yachts = Yacht.all
  end
end
