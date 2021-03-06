class Screenshot < ApplicationRecord
  belongs_to :game

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
