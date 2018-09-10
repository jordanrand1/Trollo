require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'body' do
    it {should respond_to :body}
  end
end
