class BooksController < ApplicationController
  before_action :get_book, only:[:show, :destroy, :update, :edit, :upvote]
  def index
    @books = Book.all.order(:upvotes).reverse
  end

  def new
    @book = Book.new
  end


  def show
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def update
    @book.update(book_params[:book])
    redirect_to book_path(@book)
  end

  def create
    book = Book.create(book_params[:book])
    book.save ? (redirect_to book_path(book)) : (render :new)
  end

  def edit
  end

  def upvote
    @book.upvotes += 1
    @book.save
    redirect_to book_path(@book)
  end

  private
  def get_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(book:[:id, :title, :author, :description, :upvotes])
  end
end
