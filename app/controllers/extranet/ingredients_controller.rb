class Extranet::IngredientsController < Extranet::IndexController
  def index
    @extranet_ingredients = Ingredient.where('provider_id = ?', current_provider.id)
  end

  def new
    @extranet_ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    @ingredient.provider_id = current_provider.id
    create!
  end

  def show
    @extranet_ingredient = Ingredient.find(params[:id])
  end

  def edit
    @extranet_ingredient = Ingredient.find(params[:id])
  end
end
