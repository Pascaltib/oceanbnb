class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @yachts = Yacht.all
  end
end
