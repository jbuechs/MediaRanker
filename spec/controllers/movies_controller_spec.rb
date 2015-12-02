require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like 'shared_tests'
  
  describe "GET 'edit'" do
    it "renders edit view" do
      movie = Movie.create(title:"Schindler's List 2", director: "Steven Spielberg")
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

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
    let(:good_params) do
      {
        movie: {
          title: "Schindler's List 2",
          director: "Steven Spielberg"
        }
      }
    end
    let(:bad_params) do
      {
        movie: {
          title: "Schindler's List 2",
        }
      }
    end
    it "redirects to show page on success" do
      post :create, good_params
      new_movie = Movie.last
      expect(subject).to redirect_to movie_path(new_movie.id)
    end
    it "renders new page on fail" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:movie) do
      Movie.create(title: "Schindler's List", director: "Steven Spielberg")
    end
    it "redirects to show page on success" do
      update_params = {
        movie: {
          title: "Schindler's List 2",
        },
        id: movie.id
      }
      patch :update, update_params
      expect(subject).to redirect_to movie_path(movie.id)
    end
    it "redirects to edit page on fail" do
      bad_params = {
        movie: {
          title: "",
        },
        id: movie.id
      }
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      movie = Movie.create(title: "Schindler's List", director: "Steven Spielberg")
      delete :destroy, id: movie.id
      expect(subject).to redirect_to movies_path
    end
  end

  describe "POST 'upvote'" do
    it "redirects to show page" do
      movie = Movie.create(title: "Schindler's List", director: "Steven Spielberg")
      post :upvote, id: movie.id
      expect(subject).to redirect_to movie_path(movie.id)
    end
  end


end
