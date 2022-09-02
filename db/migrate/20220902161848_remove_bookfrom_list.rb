class RemoveBookfromList < ActiveRecord::Migration[7.0]
  def change
    remove_reference :lists, :book, index: true, foreign_key: true
  end
end
