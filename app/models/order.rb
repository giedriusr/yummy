class Order < ActiveRecord::Base

  attr_accessible :status

  has_many :order_items
  has_many :items

  def total
    order_items.inject(0) { |sum, n| n.price * n.quantity + sum }
  end

  def complete(customer_id, address_id)
    self.status = 'New'
    self.customer_id = customer_id
    self.delivery_address_id = address_id
  end

end
