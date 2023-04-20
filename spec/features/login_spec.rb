require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
  before :each do
    @user = User.new(name: 'Mohamed', email: 'hello@gmail.com', password: 'password')
    @user.save
    visit new_user_session_path
  end

  it 'should have a log in form' do
    expect(page).to have_selector("form")
  end

  it 'should have a log in button' do
    expect(page).to have_button('Log in')
  end

  it 'should be able to log in' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
  end
end