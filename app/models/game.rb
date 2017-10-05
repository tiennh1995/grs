class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :game_genres, dependent: :destroy
  has_many :screenshots, dependent: :destroy
  has_many :genres, through: :game_genres, source: :genre

  mount_uploader :cover, CoverUploader

  ["rate_five", "rate_four", "rate_three", "rate_two", "rate_one"]
    .each do |rate|
      define_method rate do
        reviews.where point: Settings.rate.send(rate)
      end
  end

  def avarage_rate
    (total_rate / reviews.size).to_f
  end

  private
  def total_rate
    sum_rate = 0;
    ["rate_five", "rate_four", "rate_three", "rate_two", "rate_one"]
      .each do |rate|
      sum_rate += self.send(rate).size * Settings.rate.send(rate)
    end
    sum_rate
  end
end
