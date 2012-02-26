class Ingredient < ActiveRecord::Base
  has_many :ingredient_categorization
  has_many :items, :through => :ingredient_categorization
end
