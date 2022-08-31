class Book < ApplicationRecord
  has_many :readings
  has_many :reviews
  has_many :users, through: :readings
  has_many :users, through: :reviews

  validates :title, length: { minimum: 1 }

  def display_title
    if title.length > 20
      "#{title[0..20]}..."
    else
      title
    end
  end
end
