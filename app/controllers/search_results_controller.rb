class SearchResultsController < ApplicationController
  before_filter :initialize_order

  def index
    @geo_location = Geocoder.search('188.4.31.200').first # request.ip

    @search = Search.new(params[:search])
    if @search.valid?
      @offices = Office.near(@geo_location.ip, 1.4)
      @items = Item.where('name LIKE ?', "%#{@search.query}%").group('provider_id')
    else
      render 'index/index'
    end
  end
end
