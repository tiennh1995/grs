class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :emotitions, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  enum sex: [:male, :female]

  validates :nick_name, presence: true

  def invole_reviews
    review_ids = reviews.pluck :id
    review_ids += Comment.where(user_id: self.id).pluck :review_id
    review_ids += Emotition.where(user_id: self.id, emotition_type: :like)
      .pluck :review_id

    review_ids = review_ids.uniq
    Review.where id: review_ids
  end

  def liked? review
    emotitions.find_by review: review, emotition_type: :like
  end

  def disliked? review
    emotitions.find_by review: review, emotition_type: :dislike
  end
end
