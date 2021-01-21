class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, presence: true, uniqueness: true

  has_many :posts
  has_one_attached :profile_picture
end
