class ChangeNameForDeliveryAddresses < ActiveRecord::Migration
  def up
    rename_table :customer_delivery_addresses, :addresses
  end

  def down
    rename_table :addresses, :customer_delivery_addresses
  end
end
