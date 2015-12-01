class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true

  after_initialize :init

  def init
    self.upvotes ||= 0
  end
end
