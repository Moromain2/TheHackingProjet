class User < ApplicationRecord
  has_many :categories, through: :videos
  has_many :videos
end
