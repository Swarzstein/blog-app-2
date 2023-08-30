require 'rails_helper'

describe 'Posts Show', type: :system do
  let!(:author) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
  let!(:user) { User.create(name: 'Kenshiro', photo: 'https://Kenshiro.jpg', bio: 'Martial Artist') }
  let!(:post) do
    Post.create(
      author:,
      title: 'The way of the Water',
      text: 'In martial arts, the way of the water is the way of the soft and yielding.'
    )
  end
  let!(:comment1) do
    Comment.create(
      user:,
      post:,
      text: 'I prefer the way of the leaf, which is the way of the ninja.'
    )
  end
  let!(:comment2) do
    Comment.create(
      user: author,
      post:,
      text: 'The way of the leaf is the way of the coward.'
    )
  end
  let!(:comment3) do
    Comment.create(
      user:,
      post:,
      text: 'The way of the leaf is not the way of the coward,' \ 
            ' ninjas are not cowards but warriors who fight in the shadows.'
    )
  end

  it 'displays the post title' do
    visit user_post_path(author, post)
    expect(page).to have_content('The way of the Water')
  end

  it 'displays the post text' do
    visit user_post_path(author, post)
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding.')
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
    expect(page).to have_content('The way of the leaf is not the way of the coward,'\ 
                                 'ninjas are not cowards'\ 
                                 ' but warriors who fight in the shadows.')
  end
end
