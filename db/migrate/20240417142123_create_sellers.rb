class CreateSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :sellers do |t|
      t.string :email
      t.string :website
      t.string :social_media_link
      t.string :seller_name
      t.text :description

      t.timestamps
    end
  end
end
