class BooksController < ApplicationController
  before_action :get_book only:[:show, :destroy, :update, :edit]
  def index
  end

  private
  def get_book
    @book = Book.find(params[:id])
  end
end
