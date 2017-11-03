class Category < ApplicationRecord
  has_many :users, through: :videos
  has_many :videos
end
