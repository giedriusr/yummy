class SearchResultsController < ApplicationController
  before_filter :initialize_cart, :set_ip

  def index
    @search = Search.new(params[:search])
    if @search.valid?
      session[:search] = @search
      @geo_location = Geocoder.search(@search.address).first
      @geo = @geo_location.geometry['location']
      @providers = Provider.joins(:items).where('items.name LIKE ?', "%#{@search.query}%").uniq
      @offices = Office.valid_offices(@providers, [@geo['lat'], @geo['lng']])
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
