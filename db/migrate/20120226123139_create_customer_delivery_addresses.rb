class CreateCustomerDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :customer_delivery_addresses do |t|
      t.integer :customer_id
      t.string :address
      t.string :city
      t.string :country_code
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
