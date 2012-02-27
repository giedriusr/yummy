class Extranet::MenusController < Extranet::IndexController
  def index
    @extranet_menus = Menu.all
  end

  def new
    @extranet_menu = Menu.new
  end

  def show
    @extranet_menu = Menu.find(params[:id])
  end

  def edit
    @extranet_menu = Menu.find(params[:id])
  end
end