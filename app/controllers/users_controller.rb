class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reading = Reading.new
  end
end
