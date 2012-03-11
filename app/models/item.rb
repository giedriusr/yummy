class Item < ActiveRecord::Base

  attr_accessible :name, :price, :description

  has_many :categorization
  has_many :menus, :through => :categorization

  has_many :ingredient_categorization
  has_many :ingredients, :through => :ingredient_categorization

  has_many :order_items
  has_many :orders, :through => :order_items
  belongs_to :provider

end
