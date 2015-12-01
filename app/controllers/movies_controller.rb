class MoviesController < ApplicationController
  before_action :get_movie, only:[:show, :destroy, :update, :edit, :upvote]

  def index
    @movies = Movie.all.order(:upvotes).reverse
  end

  def new
    @movie = Movie.new
  end

  def create
    Movie.create(movie_params[:movie])
    redirect_to movies_path
  end


  def show
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def update
    @movie.update(movie_params[:movie])
    redirect_to movie_path(@movie)
  end

  def edit
  end

  def upvote
    @movie.upvotes += 1
    @movie.save
    redirect_to movie_path(@movie)
  end

  private
  def get_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.permit(movie:[:id, :title, :director, :description, :upvotes])
  end
end
