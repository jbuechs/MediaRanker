class MoviesController < ApplicationController
  before_action :get_movie, only:[:show, :destroy, :update, :edit]

  def index
    @movies = Movie.all
  end

  def show
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
  def get_movie
    @movie = Movie.find(params[:id])
  end
end
