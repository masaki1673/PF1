class Comic < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  acts_as_taggable_on :skills, :interests
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: {in: 1..200}
  #validates :image, presence: true
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end