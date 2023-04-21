require 'rails_helper'

RSpec.describe 'Recipe Food page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Mohamed', email: 'hello@gmail.com', password: 'password')

    @recipe1 = Recipe.create!(name: 'Test 1', description: 'test description 1', public: true, preparation_time: 10,
                              cooking_time: 10, user_id: @user1.id)

    @recipe2 = Recipe.create!(name: 'Test Recipe 2', description: 'test description 2', public: false,
                              user_id: @user1.id)

    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_on 'Log in'
  end

  it 'should display all recipes' do
    visit user_recipes_path(@user1.id)
    expect(page).to have_content('Test 1')
    expect(page).to have_content('Test Recipe 2')
    expect(page).to have_content('test description 1')
    expect(page).to have_content('test description 2')
  end

  it 'should show remove and New Recipe button' do
    visit user_recipes_path(@user1.id)
    expect(page).to have_content('New Recipe')
    expect(page).to have_content('Remove')
  end

  it 'should shoow recipe show page' do
    visit user_recipes_path(@user1.id)
    click_on 'Test 1'
    expect(page).to have_content('Test 1')
    expect(page).to have_content('Generate Shopping List')
    expect(page).to have_content('Add Ingredient')
  end

  it 'should take you Ingredient form page' do
    visit new_user_recipe_recipe_food_path(@user1.id, @recipe1.id)
    click_on 'Add Ingredient'
    expect(page).to have_content('Select Ingredient')
  end

  it 'should take you to shopping list page' do
    visit user_recipe_path(@user1.id, @recipe1.id)
    click_on 'Generate Shopping List'
    expect(page).to have_content('Shopping List')
  end
end
