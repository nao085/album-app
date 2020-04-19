class Album < ApplicationRecord
  belongs_to :user
  has_many :album_images, dependent: :destroy
  accepts_nested_attributes_for :album_images, allow_destroy: true, reject_if: :all_blank
  # validates_associated :album_images
  validates :album_images, presence: true, length: { maximum: 10}
  validates :title, {presence: true, length: {maximum: 40}}
end
