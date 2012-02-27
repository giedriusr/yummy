class SearchResultsController < ApplicationController
  before_filter :initialize_order

  def index
    @address = params[:address]
    @geo = Geocoder.search(@address)
    @items = Item.where('name LIKE ?', "%#{params[:wish]}")
    @wish = params[:wish]

    session[:search_page] = request.env['REQUEST_URI']
  end
end
