class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :comments, dependent: :destroy
  has_many :emotitions, dependent: :destroy
  has_many :likes, -> {where emotition_type: :like}, class_name: Emotition.name
  has_many :dislikes, -> {where emotition_type: :dislike},
    class_name: Emotition.name

  scope :load_review_with_title, ->(review_title){where "title LIKE ?",
    "%#{review_title}%"}

  validates :user, presence: true
  validates :game, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :point, presence: true,
    numericality: {greater_than: 0, less_than_or_equal_to: 5}

  def emotition_by_user user
    emotitions.find_by user: user
  end

  class << self
    def top_reviews
      review_ids = Emotition.where(emotition_type: :like).group(:review_id).
        order("COUNT(review_id)").pluck :review_id
      review_ids += pluck(:id) if review_ids.empty?
      where id: review_ids.uniq
    end
  end
end
