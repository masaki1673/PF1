class Comic < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :title, presence: true
  validates :body, presence: true, length: {in: 1..200}
  validates :name, presence: true
  validates :image, presence: true
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
