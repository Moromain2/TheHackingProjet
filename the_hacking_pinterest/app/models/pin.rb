class Pin < ApplicationRecord
  has_many :comments
  validates :name, presence: true
  validates :url, presence: true
end
