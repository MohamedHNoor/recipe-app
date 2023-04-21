require_relative '../rails_helper'

RSpec.describe 'The public recipes page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Mohamed', email: 'hello@gmail.com', password: 'password')

    @recipe1 = Recipe.create!(name: 'Test 1', description: 'test description 1', public: true, preparation_time: 10,
                              cooking_time: 10, user_id: @user1.id)

    @recipe2 = Recipe.create!(name: 'Test Recipe 2', description: 'test description 2', public: false,
                              user_id: @user1.id)
  end

  it 'should display all public recipes' do
    visit public_recipes_path
    expect(page).to have_content('Total Food Items')
    expect(page).to have_content('Total Price')
    expect(page).to have_content('Test 1')
    expect(page).to have_content('By: Mohamed')
  end
end
