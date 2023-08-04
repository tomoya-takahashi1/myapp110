class Post < ApplicationRecord
  validates :name, presence: true
  validates :set, numericality: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_and_belongs_to_many :muscles
end
