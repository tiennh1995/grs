class Genre < ApplicationRecord
  has_many :game_genres, dependent: :destroy

  validates :name, presence: true
end
