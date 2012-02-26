class AlterCustomerDeliveryAddresses < ActiveRecord::Migration
  def up
    remove_column :customer_delivery_addresses, :longitude
    remove_column :customer_delivery_addresses, :latitude

    add_column :customer_delivery_addresses, :longitude, :float, :after => :country_code
    add_column :customer_delivery_addresses, :latitude, :float, :after => :longitude
  end

  def down
    remove_column :customer_delivery_addresses, :longitude
    remove_column :customer_delivery_addresses, :latitude

    add_column :customer_delivery_addresses, :longitude, :string, :after => :country_code
    add_column :customer_delivery_addresses, :latitude, :string, :after => :country_code
  end
end
