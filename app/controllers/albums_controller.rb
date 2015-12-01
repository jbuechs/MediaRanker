class AlbumsController < ApplicationController
  before_action :get_album, only:[:show, :destroy, :update, :edit]
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def show
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def update
    @album.update(album_params[:album])
    redirect_to album_path(@album)
  end

  def create
    Album.create(album_params[:album])
    redirect_to albums_path
  end

  def edit
  end

  private
  def get_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.permit(album:[:id, :title, :artist, :description, :upvotes])
  end
end
