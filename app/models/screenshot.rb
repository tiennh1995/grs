class Screenshot < ApplicationRecord
  belongs_to :game

  validates :image, presence: true
end
