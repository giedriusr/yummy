class ProvidersController < ApplicationController
  before_filter :initialize_cart
  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
  end
end
