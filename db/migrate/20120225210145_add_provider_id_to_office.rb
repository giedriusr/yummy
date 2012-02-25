class AddProviderIdToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :provider_id, :integer
  end
end
