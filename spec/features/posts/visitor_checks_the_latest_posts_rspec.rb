require 'rails_helper'

feature 'Visitor visits the root path' do
  let!(:post) { create :post }

  background 'visit root_path' do
    visit root_path
  end

  scenario 'there is a search option' do
    expect(page).to have_button('Search')
  end

  scenario 'sees the latest posts' do
    expect(page).to have_content post.title
  end

end
