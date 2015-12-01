require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a title and an author" do
      expect(Book.new(title: "a", author: nil)).to_not be_valid
      expect(Book.new(title: nil, author: "a")).to_not be_valid
      expect(Book.new(title: "a", author: "a")).to be_valid
    end
  end
end
