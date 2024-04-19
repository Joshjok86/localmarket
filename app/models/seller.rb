class Seller < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :messages, through: :chatrooms
  belongs_to :user

  has_many_attached :photos

  validates :email, :website, uniqueness: true, allow_nil: true
  validates :email, :description, :seller_name, :address, presence: true
end
