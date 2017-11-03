class Dog < ApplicationRecord
  has_many :strolls
  has_many :doggsitters, through: :strolls
end
