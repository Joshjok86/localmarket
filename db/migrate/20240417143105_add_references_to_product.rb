class AddReferencesToProduct < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :sellers
  end
end
