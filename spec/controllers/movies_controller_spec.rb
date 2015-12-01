require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  # describe "GET 'edit'" do
  #   it "renders edit view" do
  #     movie = Movie.first
  #     get :edit, movie
  #     expect(subject).to render_template :edit, movie
  #   end
  # end

  describe "GET 'show'" do
    let(:new_movie) do
      Movie.create(title:"Schindler's List 2", director: "Steven Spielberg")
    end
    it "renders show view" do
      get :show, id: new_movie.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do

  end

  describe "PATCH 'update'" do

  end

  describe "DELETE 'destroy'" do

  end

  describe "POST 'upvote'" do

  end


end
