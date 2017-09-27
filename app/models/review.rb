class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :comments, dependent: :destroy
end
