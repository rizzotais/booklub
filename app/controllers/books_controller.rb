class BooksController < ApplicationController
  # before_action :set_book, only: %i[new create]
  skip_before_action :authenticate_user!, only: :index

  def index
    @books = Book.all
    @books = Book.search_by_title_and_author(params[:query]) if params[:query].present?
  end

  def show
    @book = Book.find(params[:id])
    @bookmarck = Bookmark.new
    @list = current_user.list
  end
end
