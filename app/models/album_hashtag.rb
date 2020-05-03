class AlbumHashtag < ApplicationRecord
  belongs_to :album
  belongs_to :hashtag
  validates :album_id, presence: true
  validates :hashtag_id, presence: true
end
