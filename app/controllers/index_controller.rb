class IndexController < ApplicationController
  caches_page :index

  def index
    @search = Search.new
  end
end