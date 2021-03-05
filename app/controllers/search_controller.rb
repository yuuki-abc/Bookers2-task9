class SearchController < ApplicationController

  def search

    method = params[:search_method]
    word = params[:search_word]
    target = params[:search_target]

    @posts = Serach.search(method, word, target)

    if target == "target_user"
      render "user_serach_result"
    elsif target == "target_book"
      render "book_serach_result"
    else
      redirect_back(fallback_location: root_path)
    end

  end

end