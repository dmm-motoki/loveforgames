class Game < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_many :favorite_games, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
