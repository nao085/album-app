class Album < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :album_images, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :album_images, allow_destroy: true, reject_if: :all_blank
  validates :album_images, presence: true, length: { maximum: 10}
  validates :title, presence: true, length: {maximum: 40}
end
