class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :menu_id
      t.integer :item_id

      t.timestamps
    end
  end
end
