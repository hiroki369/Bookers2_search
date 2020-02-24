class HomeController < ApplicationController
  def index
  end

  def about
  end

  def search
  	method = params[:search_method]
    word = params[:search_word]
    @books = Book.search(method,word)
    @users = User.search(method,word)

  end


end
