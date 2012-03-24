class Extranet::MenusController < Extranet::IndexController
  def index
    @menus = Menu.where('provider_id = ?', current_provider.id)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params[:menu])
    @menu.provider_id = current_provider.id
    create!
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end
end