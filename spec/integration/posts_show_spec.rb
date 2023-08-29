require 'rails_helper'
describe 'Users Show', type: :feature do
  let :user do
    User.create(name: 'Camilo', photo: 'https://picture.jpg', bio: 'Test bio number 1')
  end
  let!(:post1) do
    Post.create(author_id: user.id, title: 'Post number 1 test',
                text: 'random comment for a random test')
  end
  let!(:post2) do
    Post.create(author_id: user.id, title: 'test Title 2',
                text: 'amazing test you are doing! ')
  end
  let!(:post3) do
    Post.create(author_id: user.id, title: 'test title 3', text: 'test for post3 ')
  end
  before { visit user_path(user) }
  scenario "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://picture.jpg']")
  end
  scenario "I can see the user's username" do
    expect(page).to have_content('Camilo')
  end
  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end
  scenario "I can see the user's bio" do
    expect(page).to have_content('Test bio number 1')
  end
  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content('Post number 1 test')
    expect(page).to have_content('test Title 2')
    expect(page).to have_content('test title 3')
  end
  scenario "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all posts')
  end
  scenario "When I click a user's post, it redirects me to that post's show page" do
    click_link 'Post number 1 test'
    expect(page).to have_content('Post number 1 test')
    expect(page).to have_content('random comment for a random test')
  end
  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link 'See all posts'
    expect(page).to have_content('Post number 1 test')
    expect(page).to have_content('test Title 2')
    expect(page).to have_content('test title 3')
  end
end