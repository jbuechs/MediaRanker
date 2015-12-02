require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders the new page" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit page" do
      album = Album.create(title: "Ray of Light", artist: "Madonna")
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders show page" do
      album = Album.create(title: "Ray of Light", artist: "Madonna")
      get :show, id: album.id
      expect(subject).to render_template :show, id: album.id
    end
  end

  describe "POST 'create'" do

    let(:good_params) do
      {
        album: {
          title: "The Sound and the Fury",
          artist: "William Faulkner"
        }
      }
    end
    let(:bad_params) do
      {
        album: {
          title: "The Sound and the Fury"
        }
      }
    end
    it "redirects to show on success" do
      # subject { post :create, :new_album => {
      #   album: {
      #     title: "The Sound and the Fury",
      #     artist: "William Faulkner"
      #   }
      # }}
      # binding.pry
      # expect(subject).to redirect_to album_path(assigns(:new_album))

      post :create, good_params
      new_album = Album.last
      expect(subject).to redirect_to album_path(new_album.id)
    end
    it "renders new on fail" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    it "redirects to album on success" do
      album = Album.create(title: "Ray of Light", artist: "Madonna")
      update_params = {
        id: album.id,
        album: {
          title: "Ray of Light",
          artist: "Madonna",
          description: "Good beats" }
      }
      patch :update, update_params
      expect(subject).to redirect_to album_path(album.id)
    end

    it "renders edit template on fail" do
      # album = Album.create(title: "Ray of Light", artist: "Madonna")
      # update_params = {
      #   id: album.id,
      #   album: {
      #     artist: "Madonna",
      #     description: "Good beats" }
      # }

    end

  end

  describe "DELETE 'destroy'" do
    it "redirects to index on delete" do
      album = Album.create(title: "Ray of Light", artist: "Madonna")
      delete :destroy, id: album.id
      expect(subject).to redirect_to albums_path
    end
  end

  describe "POST 'upvote'" do
    it "redirects to show page" do
      album = Album.create(title: "Ray of Light", artist: "Madonna")
      post :upvote, id: album.id
      expect(subject).to redirect_to album_path(album.id)
    end
  end
end
