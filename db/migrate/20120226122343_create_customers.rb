class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone

      t.timestamps
    end
  end
end
