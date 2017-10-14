class Emotition < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true

  enum emotition_type: [:like, :dislike]
end
