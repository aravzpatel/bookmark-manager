require 'spec_helper'

feature 'Add New Bookmark' do
  before do
    visit '/'
    click_link 'Add New Bookmark!'
    fill_in 'url', with: 'http://www.testbookmark.com'
    click_button 'Add Bookmark'
  end  
  scenario 'Book added successfully' do
    expect(page).to have_content('http://www.testbookmark.com added!')
  end
  scenario 'A bookmark can be displayed after it is added' do
    visit '/bookmarks'
    expect(page).to have_content('http://www.testbookmark.com')
  end
end