class CreateProviderCuisines < ActiveRecord::Migration
  def change
    create_table :provider_cuisines do |t|
      t.integer :provider_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
