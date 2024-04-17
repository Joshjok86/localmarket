class AddDetailsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :username, :string
  end
end
