class Post < ApplicationRecord
  validates :name, presence: true
  validates :set, numericality: { greater_than_or_equal_to: 1 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
end
