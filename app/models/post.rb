class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image

  def notes
    (likes + comments).sort_by(&:created_at)
  end
end
