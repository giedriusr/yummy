class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  attr_accessible :price, :quantity, :comment
end
