class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
