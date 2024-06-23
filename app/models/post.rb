class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :title
    validates :body
  end

  def self.search(keyword)
    if keyword.present?
      Post.where(['name LIKE ?', "%#{keyword}%"])
    else
      Post.all
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

end
