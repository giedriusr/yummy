class OrderItemIngredient < ActiveRecord::Base
  belongs_to :order_item
  belongs_to :ingredient
end
