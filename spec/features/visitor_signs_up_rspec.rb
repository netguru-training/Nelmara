require 'rails_helper'

feature 'Visitor signs up' do
  let(:user) { create :user }

  background do
    visit root_path
    expect(page).to have_content 'Sign in'
    click_link 'Sign in'
  end

  scenario 'with valid email and password' do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    fill_in 'Email', :with => 'invalid@email.com'
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(page).not_to have_content('Sign out')
  end

end
