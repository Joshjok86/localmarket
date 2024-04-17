class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sellers
  belongs_to :users
end
