class AddChatroomsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :users
  end
end
