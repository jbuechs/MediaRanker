class Movie < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 25 }
  validates :director, presence: true
end
