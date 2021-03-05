class Serach < ApplicationRecord

  def self.search(method, word, target)

    if target == 'target_user'
      target = User
      column = 'name'
    end

    if target == 'target_book'
      target = Book
      column = 'title'
    end

    unless target == nil

      if method == "forward_match"
        @posts = target.where("#{column} like ?","#{word}%") # 質問 whereで二つのカラムを対象に検索する事は出来るのか？
      elsif method == "backward_match"
        @posts = target.where("#{column} like ?","%#{word}")
      elsif method == "perfect_match"
        @posts = target.where("#{column} like ?","#{word}")
      elsif method == "partial_match"
        @posts = target.where("#{column} like ?","%#{word}%")
      else
        @posts = target.all
      end

    end

  end

end