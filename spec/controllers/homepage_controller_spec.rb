require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "GET 'index'" do
    it "renders the index template" do
      get :index
      expect(subject).to render_template :index
    end
  end

end
