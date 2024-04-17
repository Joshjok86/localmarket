class AddDetailsToSeller < ActiveRecord::Migration[7.1]
  def change
    add_column :sellers, :phone_number, :string
    add_column :sellers, :address, :string
    add_column :sellers, :opening_time, :time
    add_column :sellers, :closing_time, :time
  end
end
