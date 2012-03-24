class Cart < ActiveRecord::Base

  has_many :cart_items
  has_many :items

  def total
    cart_items.inject(0) { |sum, n| n.price * n.quantity + sum }
  end

  def add(item_id)
    items = cart_items.where('item_id = ?', item_id)
    item = Item.find(item_id)

    if items.size < 1
      cart_item = cart_items.new(:quantity => 1, :price => item.price)
      cart_item.item_id = item_id
      cart_item.save
    else
      cart_item = items.first
      cart_item.update_attribute(:quantity, cart_item.quantity + 1)
    end
    cart_item
  end

  def remove(item_id)
    cart_item = cart_items.where('item_id = ?', item_id).first
    if cart_item
        if cart_item.quantity > 1
        cart_item.update_attribute(:quantity, cart_item.quantity - 1)
      else
        OrderItem.destroy(cart_item.id)
      end
    end
  end
end
