class BooksController < ApplicationController
  before_action :set_book, only: %i[new create]

  def show
    @booking = Book.find(params[:id])
  end
end
