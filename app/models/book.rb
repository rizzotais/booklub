class Book < ApplicationRecord
  has_many :readings
  has_many :reviews
  has_many :users, through: :readings
  has_many :users, through: :reviews
end
