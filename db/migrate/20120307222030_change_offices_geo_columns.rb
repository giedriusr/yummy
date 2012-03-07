class ChangeOfficesGeoColumns < ActiveRecord::Migration
  def up
    remove_column :offices, :latitude
    remove_column :offices, :longitude

    add_column :offices, :latitude, :float, :after => :email
    add_column :offices, :longitude, :float, :after => :email
  end

  def down
    remove_column :offices, :latitude
    remove_column :offices, :longitude

    add_column :offices, :latitude, :decimal, :after => :email
    add_column :offices, :longitude, :decimal, :after => :email
  end
end
