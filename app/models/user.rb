class User < ApplicationRecord
  has_many :sellers, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :products, through: :sellers
  has_many :messages, through: :chatrooms

  validates :username, :email, uniqueness: true
  validates :email, :firstname, :lastname, :address, :username, :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
