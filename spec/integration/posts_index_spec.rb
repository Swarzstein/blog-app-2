require 'rails_helper'

describe 'Posts Index', type: :feature do
  let!(:author) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
  let!(:user) { User.create(name: 'Kenshiro', photo: 'https://Kenshiro.jpg', bio: 'Martial Artist') }
  let!(:post1) do
    Post.create(
      author:,
      title: 'The way of the Water',
      text: 'In martial arts, the way of the water is the way of the soft and yielding.'
    )
  end
  let!(:post2) do
    Post.create(
      author:,
      title: 'The way of the Fire',
      text: 'In martial arts, the way of the fire is the way of the hard and unyielding.'
    )
  end
  let!(:post3) do
    Post.create(
      author:,
      title: 'Honor in martial arts',
      text: 'In martial arts, martial artist without honor is a martial artist without a soul.'
    )
  end
  let!(:comment1) do
    Comment.create(
      user:,
      post: post1,
      text: 'I prefer the way of the leaf, which is the way of the ninja.'
    )
  end
  let!(:comment2) do
    Comment.create(
      user: author,
      post: post1,
      text: 'The way of the leaf is the way of the coward.'
    )
  end
  let!(:comment3) do
    Comment.create(
      user:,
      post: post1,
      text: 'The way of the leaf is not the way of the coward, ' \
            'ninjas are not cowards but warriors who fight in the shadows.'
    )
  end
  let!(:comment4) do
    Comment.create(
      user:,
      post: post2,
      text: 'I resonate with the way of the fire.'
    )
  end
  let!(:comment5) do
    Comment.create(
      user: author,
      post: post2,
      text: 'finally we agree on something.'
    )
  end

  it 'displays author\'s info' do
    visit user_posts_path(author)
    expect(page).to have_content('Akai321')
    expect(page).to have_css("img[src*='https://Akaiiii.jpg']")
  end

  it 'displays all posts' do
    visit user_posts_path(author)
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('The way of the Fire')
    expect(page).to have_content('Honor in martial arts')
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding.')
    expect(page).to have_content('I prefer the way of the leaf, which is the way of the ninja.')
    expect(page).to have_content('Pagination')
  end

  it 'displays the number of comments each post has' do
    visit user_posts_path(author)
    expect(page).to have_content('Comments: 3')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Comments: 0')
  end

  it 'displays the comments for each post' do
    visit user_posts_path(author)
    expect(page).to have_content('I prefer the way of the leaf, which is the way of the ninja.')
    expect(page).to have_content('The way of the leaf is the way of the coward.')
    expect(page).to have_content('The way of the leaf is not the way of the coward, ' \
                                 'ninjas are not cowards but warriors who fight in the shadows.')
    expect(page).to have_content('I resonate with the way of the fire.')
    expect(page).to have_content('finally we agree on something.')
  end

  scenario "When I click a post's title, it redirects me to that post's show page" do
    visit user_posts_path(author)
    click_link 'The way of the Water'
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding.')
    expect(page).to have_content('I prefer the way of the leaf, which is the way of the ninja.')
    expect(page).to have_content('Comments: 3')
  end
end
