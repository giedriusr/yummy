class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :user_name
      t.string :password
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
