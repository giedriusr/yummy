class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_address_id
      t.string :status

      t.timestamps
    end
  end
end
