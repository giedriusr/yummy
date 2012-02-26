class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :provider_id
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
