class IndexController < ApplicationController
  def index
    @search = Search.new
  end
end
