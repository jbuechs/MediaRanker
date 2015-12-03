shared_examples_for 'shared_tests' do
  let(:good_params) do
    {
      album: {
        title: "Hello, World!",
        creator: "Jennie"
      }
    }
  end
  let(:bad_params) do
    {
      album: {
        title: "Hello, World!"
      }
    }
  end
  let(:update_params) do
    {
      id: new_medium.id,
      album: {
        description: "Great product!" }
    }
  end
  let(:bad_update_params) do
    {
      id: new_medium.id,
      album: {
        title: "" }
    }
  end

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
      new_medium = MODEL.create(title: "Hello, World!", creator: "Jennie")
      get :edit, id: new_medium.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders show page" do
      new_medium = MODEL.create(title: "Hello, World!", creator: "Jennie")
      get :show, id: new_medium.id
      expect(subject).to render_template :show, id: new_medium.id
    end
  end

  describe "POST 'create'" do
    it "redirects to show on success" do
      post :create, good_params
      new_medium = MODEL.last
      expect(subject).to redirect_to album_path(new_medium.id) # need to fix this path
    end
    it "renders new on fail" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let (:new_medium) do
      MODEL.create(title: "Hello, World!", creator: "Jennie")
    end
    it "redirects to album on success" do
      patch :update, update_params
      expect(subject).to redirect_to album_path(new_medium.id) # need to fix this path
    end
    it "renders edit template on fail" do
      patch :update, bad_update_params
      expect(subject).to render_template (:edit)
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index on delete" do
      new_medium = MODEL.create(title: "Hello, World!", creator: "Jennie")
      delete :destroy, id: new_medium.id
      expect(subject).to redirect_to albums_path # need to fix this path
    end
  end

  describe "POST 'upvote'" do
    it "redirects to show page" do
      new_medium = MODEL.create(title: "Hello, World!", creator: "Jennie")
      post :upvote, id: new_medium.id
      expect(subject).to redirect_to album_path(new_medium.id) # need to fix this path
    end
  end

end
