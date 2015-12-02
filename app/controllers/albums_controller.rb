class AlbumsController < ApplicationController
  before_action :get_album, only:[:show, :destroy, :update, :edit, :upvote]
  def index
    @albums = Album.all.order(:upvotes).reverse
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
    album = Album.new(album_params[:album])
    album.save ? (redirect_to album_path(album.id)) : (render :new)
  end

  def edit
  end

  def upvote
    @album.upvotes += 1
    @album.save
    redirect_to album_path(@album)
  end

  private
  def get_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.permit(album:[:id, :title, :artist, :description, :upvotes])
  end
end
