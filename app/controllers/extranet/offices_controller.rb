class Extranet::OfficesController < Extranet::IndexController
  def index
    @extranet_offices = Office.where('provider_id = ?', current_provider.id)
  end

  def new
    @extranet_office = Office.new
  end

  def create
    @office = Office.new(params[:office])
    @office.provider_id = current_provider.id
    create!
  end

  def show
    @extranet_office = Office.find(params[:id])
  end

  def edit
    @extranet_office = Office.find(params[:id])
  end
end
