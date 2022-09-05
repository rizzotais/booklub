class ReadingsController < ApplicationController
  def create
    @reading = Reading.new(params_read)
    @reading.user = current_user
    if @reading.save!
      redirect_to user_path(current_user)
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  private

  def params_read
    params.require(:reading).permit(:given_page, :book_id)
  end
end
