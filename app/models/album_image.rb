class AlbumImage < ApplicationRecord
  belongs_to :album, optional: true

  mount_uploader :image, ImageUploader
  validates :image, presence: true
end
