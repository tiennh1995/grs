class Genre < ApplicationRecord
  has_many :game_genres, dependent: :destroy
  has_many :games, through: :game_genres, source: :game

  validates :name, presence: true
end
