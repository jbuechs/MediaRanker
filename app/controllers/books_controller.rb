class BooksController < ApplicationController
  before_action :get_book, only:[:show, :destroy, :update, :edit]
  def index
    @books = Book.all
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
  end

  def edit
  end

  private
  def get_book
    @book = Book.find(params[:id])
  end
end
