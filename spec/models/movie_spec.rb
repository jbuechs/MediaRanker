require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a title and a director" do
      expect(Movie.new(title: "a", director: nil)).to_not be_valid
      expect(Movie.new(title: nil, director: "a")).to_not be_valid
      expect(Movie.new(title: "a", director: "a")).to be_valid
    end
  end
end
