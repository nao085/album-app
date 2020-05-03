class Album < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :album_images, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_and_belongs_to_many :hashtags
  accepts_nested_attributes_for :album_images, allow_destroy: true, reject_if: :all_blank
  validates :album_images, presence: true, length: { maximum: 10}
  validates :title, presence: true, length: {maximum: 40}

  def self.search(search)
    return Album.all unless search
    Album.where('title LIKE(?)', "%#{search}%")
  end

  after_create do
    album = Album.find_by(id: self.id)
    hashtags = self.title.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      album.hashtags << tag
    end
  end

  before_update do
    album = Album.find_by(id: self.id)
    album.hashtags.clear
    hashtags = self.title.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      album.hashtags << tag
    end
  end
end