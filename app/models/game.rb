class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :game_genres, dependent: :destroy
  has_many :screenshots, dependent: :destroy
  has_many :genres, through: :game_genres, source: :genre
  has_many :rates, dependent: :destroy

  mount_uploader :cover, CoverUploader

  validates :name, presence: true
  validates :point, presence: true

  ["rate_five", "rate_four", "rate_three", "rate_two", "rate_one"]
    .each do |rate|
      define_method rate do
        reviews.where(point: Settings.rate.send(rate)).size + rates
          .where(point: Settings.rate.send(rate)).size
      end
  end

  def avarage_rate
    return 0 if (reviews.size + rates.size) == 0
    (total_rate.to_f / (reviews.size + rates.size).to_f).round 2
  end

  class << self
    def top_games
      all.order(point: :desc).limit 5
    end

    def recent_games
      all.order(point: :desc).limit 3
    end

    def load_game_with_genres genre_ids
      game_ids = GameGenre.where(genre_id: genre_ids).group(:game_id)
        .having("COUNT(game_id) >= ?", genre_ids.size).pluck :game_id
      Game.where id: game_ids
    end

    def load_game_with_name game_name
      where "name LIKE ?", "%#{game_name}%"
    end
  end

  private
  def total_rate
    sum_rate = 0;
    ["rate_five", "rate_four", "rate_three", "rate_two", "rate_one"]
      .each do |rate|
      sum_rate += self.send(rate) * Settings.rate.send(rate)
    end
    sum_rate
  end
end
