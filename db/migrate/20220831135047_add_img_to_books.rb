class AddImgToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :img_book, :string
  end
end
