class ReviewsController < ApplicationController
  before_action :set_book, only: %i[new create]

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to new_book_review_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
