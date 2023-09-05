class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         attachment :profile_image
         mount_uploader :profile_image_id, ImageUploader
         validates :name, presence: true
         
         def self.guest
          find_or_create_by(email: 'guesttt@example.com') do |user|
            user.password = SecureRandom.hex(8)
            user.name = 'ゲストさん'
            user.profile = '腹筋10回'
            user.profile_image_id = 'https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_7.png'
         end
  end

  def guest?
    false
  end

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
