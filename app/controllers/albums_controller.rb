class AlbumsController < ApplicationController
  before_action :get_album only:[:show, :destroy, :update, :edit]
  def index

  end

  private
  def get_album
    @album = Album.find(params[:id])
  end
end
