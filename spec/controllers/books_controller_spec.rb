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
    it "renders edit view" do
      book = Book.create(title: "The Sound and the Fury", author: "William Faulkner")
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders show view" do
      book = Book.create(title: "The Sound and the Fury", author: "William Faulkner")
      get :show, id: book.id
      expect(subject).to render_template :show, id: book.id
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        book: {
          title: "The Sound and the Fury",
          author: "William Faulkner"
        }
      }
    end
    let(:bad_params) do
      {
        book: {
          title: "The Sound and the Fury"
        }
      }
    end
    it "redirects to show view on success" do
      post :create, good_params
      new_book = Book.last
      expect(subject).to redirect_to book_path(new_book.id)
    end

    it "renders new view on fail" do
      post :create, bad_params
      expect(subject).to render_template :new
    end

  end

  describe "PATCH 'update'" do
    let(:book) do
      Book.create(title: "The Sound and the Fury", author: "William Faulkner")
    end
    it "redirects to show page on success" do
      good_params = {
        id: book.id,
        book: {
          description: "Challenging read but worth the effort."
        }
      }
      patch :update, good_params
      expect(subject).to redirect_to book_path(book.id)
    end
    it "renders edit page on fail" do
      bad_params = {
        id: book.id,
        book: {
          title: "",
        }
      }
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      book = Book.create(title: "The Sound and the Fury", author: "William Faulkner")
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end
  end

  describe "POST 'upvote'" do
    it "redirects to show page" do
      book = Book.create(title: "The Sound and the Fury", author: "William Faulkner")
      post :upvote, id: book.id
      expect(subject).to redirect_to book_path(book.id)
    end
  end
end
