class AddTitleToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :title, :string, :limit => 50, :after => :id
  end
end
