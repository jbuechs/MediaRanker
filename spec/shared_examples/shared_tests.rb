shared_examples_for 'shared_tests' do

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
end
