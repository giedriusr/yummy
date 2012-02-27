class AlterPasswordToPasswordDigest < ActiveRecord::Migration
  def up
    remove_column :providers, :password
    add_column :providers, :password_digest, :string, :after => :email
  end

  def down
    remove_column :providers, :password_digest
    add_column :providers, :password, :string
  end
end
