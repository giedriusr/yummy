class SearchResultsController < ApplicationController
  before_filter :initialize_order

  def index
    @search = Search.new(params[:search])
    if @search.valid?
      @items = Item.where('name LIKE ?', "%#{@search.query}%")
    else
      render 'index/index'
    end
  end
end
