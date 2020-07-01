feature 'viewing bookmarks' do
  scenario 'a user goes to the bookmarks page' do
    visit '/bookmarks'
    expect(page).to have_content('http://www.reddit.com')
  end
end