require_relative '../rails_helper'

RSpec.describe 'The page index page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Luis', email: 'labarca@gmail.com', password: '123456')
    @user1.save
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    visit root_path
  end

  it 'should be able to see Foods' do
    expect(page).to have_content('Food List')
  end

  it 'should be able to redirect to add food route' do
    click_link 'Add Food'
    expect(page).to have_content('New Food')
  end

  it 'should be able to see save food' do
    click_link 'Add Food'
    fill_in 'Name', with: 'Pizza'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: '10'
    click_button 'Create Food'
    expect(page).to have_content('Pizza')
  end
end