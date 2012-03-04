class SearchResultsController < ApplicationController
  before_filter :initialize_order

  def index
    @search = Search.new(params[:search])
    if @search.valid?
      @geo = Geocoder.search(@search.address)
      @items = Item.where('name LIKE ?', "%#{@search.query}%")
      session[:search_page] = request.env['REQUEST_URI']
    else
      render 'index/index'
    end
  end
end
