require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_food).dependent(:destroy) }
  end
end
