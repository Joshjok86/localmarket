class AddReferencesToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :sellers, :users
  end
end
