class Ingredient < ActiveRecord::Base

  attr_accessible :name

  has_many :ingredient_categorization
  has_many :items, :through => :ingredient_categorization
  belongs_to :provider
end
