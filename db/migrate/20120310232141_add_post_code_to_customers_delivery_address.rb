class AddPostCodeToCustomersDeliveryAddress < ActiveRecord::Migration
  def change
    add_column :customer_delivery_addresses, :post_code, :string, :after => :address
    add_column :offices, :post_code, :string, :after => :address
  end
end
