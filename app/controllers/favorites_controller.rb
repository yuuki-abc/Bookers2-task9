class FavoritesController < ApplicationController


 def create
    @book = Book.find(params[:book_id])
    @class = ".favorite-btn-#{@book.id}"
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @class = ".favorite-btn-#{@book.id}"
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # redirect_back(fallback_location: root_path)
  end

  # def set_variables
  #   @book = Book.find(params[:book_id])
  #   @class = "favorite-btn-#{@book.id}"
  #   @book_id = ".favorite-btn-#{@book.id}"
  # end
end
