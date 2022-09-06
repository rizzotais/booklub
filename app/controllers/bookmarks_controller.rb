class BookmarksController < ApplicationController
   before_action :set_bookmark, only: :destroy

  def create
    @bookmark = Bookmark.new
    @book = Book.find(params[:book_id])
    @bookmark.book = @book
    @bookmark.list = current_user.list
    if @bookmark.save
      flash[:notice] = "Book added to your list"
      redirect_to user_path(current_user)
    else
      @review = Review.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
