class Post < ApplicationRecord
  validates :name, presence: true
  validates :set, numericality: true
  belongs_to :user, required: true
  has_many :favorites, dependent: :destroy
end
