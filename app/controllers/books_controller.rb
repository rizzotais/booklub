class BooksController < ApplicationController
  # before_action :set_book, only: %i[new create]

  def index
    @books = Book.all
  end

  def show
    @booking = Book.find(params[:id])
  end
end
