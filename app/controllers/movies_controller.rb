class MoviesController < ApplicationController
  before_action :get_movie only:[:show, :destroy, :update, :edit]

  def index
  end

  private
  def get_movie
    @movie = Movie.find(params[:id])
  end
end
