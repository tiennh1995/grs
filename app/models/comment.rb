class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  has_many :reply_comments, dependent: :destroy

  validates :user, presence: true
  validates :review, presence: true
  validates :content, presence: true
end
