class ChangeReferences < ActiveRecord::Migration[7.1]
  def change
    remove_reference :chatrooms, :users
    add_reference :chatrooms, :user
    remove_reference :chatrooms, :sellers
    add_reference :chatrooms, :seller
    remove_reference :sellers, :users
    add_reference :sellers, :user
    remove_reference :products, :sellers
    add_reference :products, :seller
    remove_reference :messages, :chatrooms
    add_reference :messages, :chatroom
  end
end
