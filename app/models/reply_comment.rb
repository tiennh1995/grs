class ReplyComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :reply_user, class_name: User.name, foreign_key: :reply_user_id

  validates :user, presence: true
  validates :comment, presence: true
  validates :reply_user, presence: true
end
