class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home, :about, :contactus ]


  def home
    @books = Book.all
  end


  def about
  end

  def contactus
  end
end
