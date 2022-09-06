class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home, :about, :contactus ]


  def home
    @books = Book.all

    @fiction_books = Book.where(category: "Fiction").sample(4)
  end


  def about
  end

  def contactus
  end
end
