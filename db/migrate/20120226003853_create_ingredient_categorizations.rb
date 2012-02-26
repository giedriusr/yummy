class CreateIngredientCategorizations < ActiveRecord::Migration
  def change
    create_table :ingredient_categorizations do |t|
      t.integer :ingredient_id
      t.integer :item_id

      t.timestamps
    end
  end
end
