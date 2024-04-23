class Review < ApplicationRecord
  belongs_to :user
  belongs_to :seller

  validates :title, :content, :rating, presence: true

  has_many_attached :photos
end
