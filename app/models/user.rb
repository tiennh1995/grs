class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook,
    :google_oauth2]

  has_many :comments, dependent: :destroy
  has_many :reply_comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :emotitions, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :game_follows, dependent: :destroy
  has_many :games, through: :game_follows, foreign_key: :user_id
  has_many :requests, dependent: :destroy

  scope :load_user_with_name, ->(user_name){where "nick_name LIKE ?",
    "%#{user_name}%"}
  scope :user_alls, ->{where admin: false}

  mount_uploader :avatar, AvatarUploader

  enum sex: [:male, :female]

  validates :nick_name, presence: true

  def invole_reviews
    review_ids = reviews.pluck :id
    review_ids += Comment.where(user_id: self.id).pluck :review_id
    review_ids += Emotition.where(user_id: self.id, emotition_type: :like)
      .pluck :review_id
    review_ids += game_follows.pluck :review_id

    review_ids = review_ids.uniq
    Review.where id: review_ids
  end

  def liked? review
    emotitions.find_by review: review, emotition_type: :like
  end

  def disliked? review
    emotitions.find_by review: review, emotition_type: :dislike
  end

  def rated? game
    rates.find_by game: game
  end

  def followed? game
    game_follows.find_by game: game
  end

  def reviewed? game
    reviews.find_by game: game
  end

  def all_game
    Game.all
  end

  def followed
    games
  end

  def unfollow
    Game.where.not id: game_follows.pluck(:game_id)
  end

  class << self
    def from_omniauth auth
      email = auth.provider + "_" + auth.info.email
      user = where(email: email, provider: auth.provider).first
      unless user
        user = User.new provider: auth.provider, email: email,
          password: Devise.friendly_token[0,20], nick_name: auth.info.name,
          avatar_cloud: auth.info.image
        user.save
      end
      user
    end
  end
end
