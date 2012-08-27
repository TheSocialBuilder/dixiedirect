class Dashboard::DashboardController < ApplicationController
  layout "dashboard"

  before_filter :authenticate_user!
  
  def index
    # @listings = Listing.all.cache
    # @listings = Listing.limit(5).cache
  end

end