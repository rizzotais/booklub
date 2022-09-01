class Book < ApplicationRecord
  has_many :readings
  has_many :reviews
  has_many :users, through: :readings
  has_many :users, through: :reviews

  include PgSearch::Model
  pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
      tsearch: { prefix: true }
    }


  validates :title, length: { minimum: 1 }

  def display_title
    if title.length > 20
      "#{title[0..20]}..."
    else
      title
    end
  end
end
