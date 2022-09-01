class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contactus ]

  def home
  end


  def contactus
  end
end
