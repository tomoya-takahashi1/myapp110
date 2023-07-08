class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         attachment :profile_image
         mount_uploader :profile_image_id, ImageUploader
         validates :name, presence: true

         def self.guest
          find_or_create_by(email: 'guest@example.com') do |user|
            user.password = SecureRandom.hex(8)
            user.name = 'ゲストさん'
        end
  end

  def guest?
    false
  end

  has_many :posts
  has_many :favorites, dependent: :destroy

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
