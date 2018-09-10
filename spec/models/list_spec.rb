require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'name' do
    it {should respond_to :name}
  end
end
