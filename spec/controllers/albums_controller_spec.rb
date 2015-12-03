require 'rails_helper'

MODEL = "Album".constantize

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like 'shared_tests'
end
