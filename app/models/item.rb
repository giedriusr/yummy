class Item < ActiveRecord::Base
  has_many :categorization
  has_many :menus, :through => :categorization

  has_many :ingredient_categorization
  has_many :ingredients, :through => :ingredient_categorization

  def get_provider
    menu = menus.first
    provider = Provider.find_by_id(menu.provider_id)
    provider
  end

end
