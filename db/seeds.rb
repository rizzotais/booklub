# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

user = User.new(
  email: 'banana@lewagon.com',
  password: '123456'
)
user.save!
book = Book.new(title: Faker::Book.title, author: Faker::Book.author, category: Faker::Book.genre, published_year: 2022, description: "this book is very good and needs description")
book.save!
Reading.create!(user_id:user, book_id:book, given_page:387)
