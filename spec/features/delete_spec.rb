require 'spec_helper'

feature "deleting a bookmark" do
  scenario "a user sees bookmarks with the option to delete" do
    visit '/'
    click_link('Delete Bookmark!')
    expect(page).to have_button('Delete Reddit')
  end
  
  scenario "a user sees bookmarks and tries to delete a bookmark" do
    visit '/'
    click_link('Delete Bookmark!')
    click_button('Delete Tor')
    expect(page).to have_content('Reddit')
    expect(page).not_to have_content('Tor')
  end
end