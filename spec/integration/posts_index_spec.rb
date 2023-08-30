require 'rails_helper'

#integration test for posts index
describe 'Posts Index', type: :system do
  let!(:author) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
  let!(:user) { User.create(name: 'Kenshiro', photo: 'https://Kenshiro.jpg', bio: 'Martial Artist') }
  let!(:post1) { Post.create(
    author: author,
    title: 'The way of the Water',
    text: 'In martial arts, the way of the water is the way of the soft and yielding, like a river. The water is able to flow around any obstacle, and is able to wear down the hardest stone.'
  ) }
  let!(:post2) { Post.create(
    author: author,
    title: 'The way of the Fire',
    text: 'In martial arts, the way of the fire is the way of the hard and unyielding, like a volcano. The fire is able to burn away any impurity, and is able to destroy any obstacle.'
  ) }
  let!(:post3) { Post.create(
    author: author,
    title: 'Honor in martial arts',
    text: 'In martial arts, honor is the way of the warrior. The warrior is able to fight with honor, and is able to defeat any opponent. a martial artist without honor is a martial artist without a soul.'
  ) }
  let!(:comment1) { Comment.create(
    user: user,
    post: post1,
    text: 'I prefer the way of the leaf, which is the way of the ninja.'
  ) }
  let!(:comment2) { Comment.create(
    user: author,
    post: post1,
    text: 'The way of the leaf is the way of the coward.'
  ) }
  let!(:comment3) { Comment.create(
    user: user,
    post: post1,
    text: 'The way of the leaf is not the way of the coward, ninjas are not cowards but warriors who fight in the shadows.'
  ) }
  let!(:comment4) { Comment.create(
    user: user,
    post: post2,
    text: 'I resonate with the way of the fire.'
  ) }
  let!(:comment5) { Comment.create(
    user: author,
    post: post2,
    text: 'finally we agree on something.'
  ) }

  it 'displays all posts' do
    visit user_posts_path(author)
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('The way of the Fire')
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding, like a river. The water is able to flow around any obstacle, and is able to wear down the hardest stone.')
    expect(page).to have_content('I prefer the way of the leaf, which is the way of the ninja.')
    expect(page).to have_content('Comments: 3')
    expect(page).to have_content('Comments: 0')
  end

  scenario "When I click a post's title, it redirects me to that post's show page" do
    visit user_posts_path(author)
    click_link 'The way of the Water'
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding, like a river. The water is able to flow around any obstacle, and is able to wear down the hardest stone.')
    expect(page).to have_content('I prefer the way of the leaf, which is the way of the ninja.')
    expect(page).to have_content('Comments: 3')
  end
end