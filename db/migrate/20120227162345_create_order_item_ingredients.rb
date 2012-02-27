class CreateOrderItemIngredients < ActiveRecord::Migration
  def change
    create_table :order_item_ingredients do |t|
      t.integer :order_item_id
      t.integer :ingredient_id
      t.float :price

      t.timestamps
    end
  end
end
