class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

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
    @book_new = Book.new
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to books_path,notice:'successfully created'
    else @books = Book.all
         @user = current_user
         render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
       redirect_to book_path(@book.id),notice:'successfully updated'
    else render :edit
    end
  end

  def  destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def correct_user
  @book = Book.find(params[:id])
  redirect_to(books_path) unless @book.user == current_user
  end



private
def book_params
  params.require(:book).permit(:title, :body)
end



end
