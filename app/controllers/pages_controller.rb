class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @users = User.all
    @user = current_user
# added to access the yatch to profile
    @yachts = Yacht.all
    # @user.yachts = date_reserved??
  end
end
