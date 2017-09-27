class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
