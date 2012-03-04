class AddProviderIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :provider_id, :integer, :after => :id
    add_column :ingredients, :provider_id, :integer, :after => :id
  end
end
