class Item < ActiveRecord::Base

  attr_accessible :provider_id, :name, :price, :description

  has_many :categorization
  has_many :menus, :through => :categorization

  has_many :ingredient_categorization
  has_many :ingredients, :through => :ingredient_categorization

  has_many :order_items
  has_many :orders, :through => :order_items

  def get_provider
    menu = menus.first
    provider = Provider.find_by_id(menu.provider_id)
    provider
  end

end
