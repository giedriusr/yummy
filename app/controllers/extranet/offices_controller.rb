class Extranet::OfficesController < Extranet::IndexController
  def index
    @offices = Office.where('provider_id = ?', current_provider.id)
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(params[:office])
    @office.provider_id = current_provider.id
    create!
  end

  def show
    @office = Office.find(params[:id])
  end

  def edit
    @office = Office.find(params[:id])
  end
end
