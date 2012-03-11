class ConvertPricesToFloat < ActiveRecord::Migration
  def up
    change_column :items, :price, :float
  end

  def down
    change_column :items, :price, :decimal
  end
end
