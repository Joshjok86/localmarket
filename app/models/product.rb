class Product < ApplicationRecord
  belongs_to :seller

  has_many_attached :photos

  validates :product_name, :description, :quantity, :price, presence: true
end
