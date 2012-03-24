class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :item_id
      t.float :price
      t.integer :quantity
      t.string :comment

      t.timestamps
    end
  end
end
