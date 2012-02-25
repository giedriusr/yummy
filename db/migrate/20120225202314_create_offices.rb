class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :city
      t.string :country_code
      t.decimal :longitude
      t.decimal :latitude
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
