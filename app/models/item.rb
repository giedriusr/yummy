class Item < ActiveRecord::Base
  has_many :categorization
  has_many :menus, :through => :categorization

  has_many :ingredient_categorization
  has_many :ingredients, :through => :ingredient_categorization

end
