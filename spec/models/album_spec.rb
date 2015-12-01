require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title and an artist" do
      expect(Album.new(title: "a", artist: nil)).to_not be_valid
      expect(Album.new(title: nil, artist: "a")).to_not be_valid
      expect(Album.new(title: "a", artist: "a")).to be_valid
    end
  end
end
