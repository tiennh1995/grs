class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :game_genres, dependent: :destroy
  has_many :screenshots, dependent: :destroy
end
