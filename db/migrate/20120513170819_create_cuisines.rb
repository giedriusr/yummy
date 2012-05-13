class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :name, :limit => 75

      t.timestamps
    end
  end
end
