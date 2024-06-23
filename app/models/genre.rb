class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true, uniqueness: true

  scope :only_active, -> { where(is_active: true) }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

end
