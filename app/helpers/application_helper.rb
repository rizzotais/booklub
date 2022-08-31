module ApplicationHelper
  def display_img(book)
    if book.img_book == nil
      asset_url("books.png")
    else
      book.img_book
    end
  end
end
