class Book < ApplicationRecord
  has_many :readings
  has_many :reviews
  has_many :users, through: :readings
  has_many :users, through: :reviews
  include PgSearch::Model
  pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
