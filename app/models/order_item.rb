class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  attr_accessible :price, :quantity, :comment
end
