class SearchResultsController < ApplicationController
  before_filter :initialize_order, :set_ip

  def index
    @geo_location = Geocoder.search(@ip).first # request.ip

    @search = Search.new(params[:search])
    if @search.valid?
      @offices = Office.near(@geo_location.ip, 1.4)
      @items = Item.where('name LIKE ?', "%#{@search.query}%").group('provider_id')
    else
      render 'index/index'
    end
  end

  private

  def set_ip
    if (Rails.env == 'development')
      @ip = '188.4.31.200'
    else
      @ip = request.ip
    end
  end
end
