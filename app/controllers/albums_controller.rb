class AlbumsController < ApplicationController
  before_action :get_album, only:[:show, :destroy, :update, :edit]
  def index
    @albums = Album.all
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
  def get_album
    @album = Album.find(params[:id])
  end
end
