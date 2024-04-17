class Product < ApplicationRecord
  belongs_to :seller

  validates :product_name, :description, :quantity, :price, presence: true
end
