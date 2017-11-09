class Request < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :game_name, presence: true
  validates :genre_info, presence: true

  enum status: [:waiting, :accepted, :cancel]
end
