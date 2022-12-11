class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :comments, dependent: :destroy

  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    FavoritePost.where(user_id: user.id).exists?
  end
end
