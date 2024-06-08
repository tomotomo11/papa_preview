class Post < ApplicationRecord
belongs_to :user
has_many :post_comments, dependent: :destroy
has_many :favorites, dependent: :destroy
belongs_to :genre
has_many :tag_relationships, dependent: :destroy

  has_one_attached :image
end
