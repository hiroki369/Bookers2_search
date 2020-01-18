class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
    @book_new  = Book.new

  end

  def show
    @book_new  = Book.new
    @book = Book.find(params[:id])
    @user = User.all


  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to books_path,notice:'successfully created'

    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id),notice:'successfully updated'
  end

  def  destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


private
def book_params
  params.require(:book).permit(:title, :body)
end


end