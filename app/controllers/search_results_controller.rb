class SearchResultsController < ApplicationController
  def index
    @address = params[:address]
    @geo = Geocoder.search(@address)
    @items = Item.where('name LIKE ?', "%#{params[:wish]}")
    @wish = params[:wish]
  end
end
