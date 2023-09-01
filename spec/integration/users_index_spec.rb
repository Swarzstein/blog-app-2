require 'rails_helper'

describe 'Users index', type: :feature do
  let!(:author1) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
  let!(:author2) { User.create(name: 'Kenshiro', photo: 'https://Kenshiro.jpg', bio: 'Martial Artist') }
  let!(:author3) { User.create(name: 'John48', photo: 'https://john99.jpg', bio: 'Photographer') }
  let!(:post1) do
    Post.create(
      author: author1,
      title: 'The way of the Water',
      text: 'In martial arts, the way of the water is the way of the soft and yielding'
    )
  end
  let!(:post2) do
    Post.create(
      author: author2,
      title: 'The way of the Fire',
      text: 'In martial arts, the way of the fire is the way of the hard and unyielding'
    )
  end
  let!(:post3) do
    Post.create(
      author: author1,
      title: 'The way of the Earth',
      text: 'In martial arts, the way of the earth is the way of the stable and unmovable'
    )
  end

  it 'displays all users' do
    visit users_path
    expect(page).to have_content('Akai321')
    expect(page).to have_content('Kenshiro')
    expect(page).to have_content('John48')
  end

  it 'displays the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of posts: 2')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 0')
  end

  scenario "When I click a user's name, it redirects me to that user's show page" do
    visit users_path
    click_link 'Akai321'
    expect(page).to have_content('Akai321')
    expect(page).to have_content('Martial Artist')
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('The way of the Earth')
  end
end
