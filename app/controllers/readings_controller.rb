class ReadingsController < ApplicationController
  before_action :set_reading, only: :destroy
  
  def create
    @reading = Reading.new(params_read)
    @reading.user = current_user
    if @reading.save!
      redirect_to user_path(current_user)
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  def update
    @reading = Reading.find(params[:id])
    @reading.update(params_read)
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.text { render partial: "users/book_info", locals: {reading: @reading, user:current_user}, formats: [:html] }
    end
  end

  def destroy
    @reading.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def params_read
    params.require(:reading).permit(:given_page, :book_id)
  end

  def set_reading
    @reading = Reading.find(params[:id])
  end
end
