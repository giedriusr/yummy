class SearchResultsController < ApplicationController
  before_filter :initialize_order, :set_ip

  def index
    @geo_location = Geocoder.search(@ip).first # request.ip

    @search = Search.new(params[:search])
    if @search.valid?
      @providers = Provider.joins(:items).where('items.name LIKE ?', "%#{@search.query}%").uniq
      @offices = Office.valid_offices(@providers, @geo_location.ip)
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
