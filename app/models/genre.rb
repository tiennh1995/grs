class Genre < ApplicationRecord
  has_many :game_genres, dependent: :destroy
  has_many :games, through: :game_genres, source: :game

  scope :load_genre_with_name, ->(genre_name){where "name LIKE ?",
    "%#{genre_name}%"}

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end
