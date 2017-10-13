class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  has_many :reply_comments, dependent: :destroy

  default_scope {order updated_at: :desc}

  validates :user, presence: true
  validates :review, presence: true
  validates :content, presence: true
end
