class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true

  after_initialize :init

  def init
    self.upvotes ||= 0
  end
end
