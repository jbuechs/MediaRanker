class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :director, presence: true

  after_initialize :init

  def init
    self.upvotes ||= 0
  end

end
