class Screenshot < ApplicationRecord
  belongs_to :game

  validates :game, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
