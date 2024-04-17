class Seller < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :email, :website, uniqueness: true
  validates :email, :description, :seller_name, :address, presence: true
end
