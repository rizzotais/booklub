class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.where("title LIKE ?", "%Harry Potter").first
  end
end
