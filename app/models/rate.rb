class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user, presence: true
  validates :game, presence: true
  validates :point, presence: true,
    numericality: {greater_than: 0, less_than_or_equal_to: 5}
end
