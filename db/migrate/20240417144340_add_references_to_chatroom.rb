class AddReferencesToChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :sellers
  end
end
