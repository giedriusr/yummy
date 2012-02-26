class SearchResultsController < ApplicationController
  def index
    @items = Item.where('name LIKE ?', "%#{params[:wish]}")
    @wish = params[:wish]
    @address = params[:address]
  end
end
