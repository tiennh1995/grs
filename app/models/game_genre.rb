class GameGenre < ApplicationRecord
  belongs_to :game
  belongs_to :genre

  validates :game, presence: true
  validates :genre, presence: true
end
