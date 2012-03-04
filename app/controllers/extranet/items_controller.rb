class Extranet::ItemsController < Extranet::IndexController
  def index
    @extranet_items = Item.where('provider_id = ?', current_provider.id)
  end

  def new
    @extranet_item= Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.provider_id = current_provider.id
    create!
  end

  def show
    @extranet_item = Item.find(params[:id])
  end

  def edit
    @extranet_item = Item.find(params[:id])
  end
end
