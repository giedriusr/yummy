class IndexController < ApplicationController
  def index
    # geo_location = Geocoder.search('188.4.31.200') # request.ip
    # @search = Search.new(geo_location.first)
    @search = Search.new
  end
end