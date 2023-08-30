require 'rails_helper'

describe 'Posts Show', type: :system do
  let!(:author) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }  
  let!(:user) { User.create(name: 'Kenshiro', photo: 'https://Kenshiro.jpg', bio: 'Martial Artist') }
  let!(:post) { Post.create(
    author: author,
    title: 'The way of the Water',
    text: 'In martial arts, the way of the water is the way of the soft and yielding, like a river. The water is able to flow around any obstacle, and is able to wear down the hardest stone.'
  ) }
  let!(:comment1) { Comment.create(
    user: user,
    post: post,
    text: 'I prefer the way of the leaf, which is the way of the ninja.'
  ) }
  let!(:comment2) { Comment.create(
    user: author,
    post: post,
    text: 'The way of the leaf is the way of the coward.'
  ) }
  let!(:comment3) { Comment.create(
    user: user,
    post: post,
    text: 'The way of the leaf is not the way of the coward, ninjas are not cowards but warriors who fight in the shadows.'
  ) }

  it 'displays the post title' do
    visit user_post_path(author, post)
    expect(page).to have_content('The way of the Water')
  end

  it 'displays the post text' do
    visit user_post_path(author, post)
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding, like a river. The water is able to flow around any obstacle, and is able to wear down the hardest stone.')
  end
  
  it 'displays the post author' do
    visit user_post_path(author, post)
    expect(page).to have_content('Akai321')
  end

  it 'displays the number of comments the post has' do
    visit user_post_path(author, post)
    expect(page).to have_content('Comments: 3')
  end

  it 'displays all comments for the post' do
    visit user_post_path(author, post)
    expect(page).to have_content('I prefer the way of the leaf, which is the way of the ninja.')
    expect(page).to have_content('The way of the leaf is the way of the coward.')
    expect(page).to have_content('The way of the leaf is not the way of the coward, ninjas are not cowards but warriors who fight in the shadows.')
  end
end