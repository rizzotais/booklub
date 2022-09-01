module ApplicationHelper
  def display_img(book)
    if book.img_book == nil
      asset_url("https://drive.google.com/file/d/16aAVCbfA6lRPVytm92UL7MPlfpOZUxJk/view?usp=sharing")
    else
      book.img_book
    end
  end
end
