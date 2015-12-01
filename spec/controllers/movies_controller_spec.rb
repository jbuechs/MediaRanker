require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    
  end

  describe "GET 'new'" do

  end

  describe "GET 'edit'" do

  end

  describe "GET 'show'" do

  end

  describe "PATCH 'update'" do

  end

  describe "DELETE 'destroy'" do

  end

  describe "POST 'upvote'" do

  end


end
