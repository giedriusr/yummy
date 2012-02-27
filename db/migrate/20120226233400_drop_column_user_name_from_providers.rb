class DropColumnUserNameFromProviders < ActiveRecord::Migration
  def up
    remove_column :providers, :user_name
  end

  def down
    add_column :providers, :user_name, :string
  end
end
