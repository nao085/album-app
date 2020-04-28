class Like < ApplicationRecord
  belongs_to :album
  belongs_to :user
  validates_uniqueness_of :album_id, scope: :user_id
end
