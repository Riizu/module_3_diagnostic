class SearchController < ApplicationController
  def index
    @stations = Station.where(zip: params[:zip])
  end
end
