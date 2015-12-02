class Book < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 25 }
  validates :author, presence: true
end
