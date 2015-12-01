require 'rails_helper'

RSpec.describe BooksController, type: :controller do
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

  describe "GET 'edit'" do
  end

  describe "GET 'show'" do

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
