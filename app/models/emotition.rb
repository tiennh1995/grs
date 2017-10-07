class Emotition < ApplicationRecord
  belongs_to :user
  belongs_to :review

  enum emotition_type: [:like, :dislike]
end
