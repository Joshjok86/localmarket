class Message < ApplicationRecord
  belongs_to :chatroom

  validates :content, presence: true
end
