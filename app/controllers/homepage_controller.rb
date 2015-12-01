class HomepageController < ApplicationController
  def index
    max = 10
    @books = Book.limit(max)
    @movies = Movie.limit(max)
    @albums = Album.limit(max)
  end
end
