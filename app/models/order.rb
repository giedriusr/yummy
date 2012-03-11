class Order < ActiveRecord::Base

  attr_accessible :status

  has_many :order_items
  has_many :items

  def total
    order_items.inject(0) { |sum, n| n.price * n.quantity + sum }
  end

  def add(item_id)
    items = order_items.where('item_id = ?', item_id)
    item = Item.find(item_id)

    if items.size < 1
      order_item = order_items.create(:item_id => item_id,
        :quantity => 1, :price => item.price)
    else
      order_item = items.first
      order_item.update_attribute(:quantity, order_item.quantity + 1)
    end
    order_item
  end

  def remove(item_id)
    order_item = order_items.where('item_id = ?', item_id).first
    if order_item
        if order_item.quantity > 1
        order_item.update_attribute(:quantity, order_item.quantity - 1)
      else
        OrderItem.destroy(order_item.id)
      end
    end
  end
end
