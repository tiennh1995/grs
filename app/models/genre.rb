class Genre < ApplicationRecord
  has_many :game_genres, dependent: :destroy
end
