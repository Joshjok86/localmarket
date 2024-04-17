class AddReferencesToMessage < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :chatrooms
  end
end
