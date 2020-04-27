class Comment < ApplicationRecord
  belongs_to :album
  belongs_to :user
  validates :text, presence: true, length: {maximum: 40},  profanity_filter: true
end