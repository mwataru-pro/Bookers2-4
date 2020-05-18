class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :guard, only: [:edit]

  def index
  	@book = Book.new
  	@books = Book.all
    @user = User.find(current_user.id)
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	redirect_to book_path(@book.id), notice: "You have creatad book successfully."
    else
    @books = Book.all
    @user = User.find(current_user.id)
    render action: :index
    end
  end

  def show
  	@book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
   else
    @books = Book.all
    render "edit"
   end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private

  def guard
    book = Book.find(params[:id])
    if book.user != current_user
      redirect_to books_path
    end
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
