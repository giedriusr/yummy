class AddressesController < ApplicationController
  before_filter :address, :except => [:index, :new, :create]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.build(params[:address])
    if @address.save
      redirect_to cart_path, :notice => 'Created!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @address.update_attributes(params[:address])
      redirect_to address_path, :notice => 'Updated'
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def address
    @address = current_user.addresses.find(params[:id])
  end
end
