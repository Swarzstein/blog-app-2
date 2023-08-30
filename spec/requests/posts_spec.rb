require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    let!(:author1) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }

    it 'works! (now write some real specs)' do
      get user_posts_path(author1)
      expect(response).to have_http_status(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('Posts from user 1')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    let!(:author1) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
    let!(:post1) do
      Post.create(
        author_id: author1.id,
        title: 'Amaterasu',
        text: 'Amaterasu is the goddess of the sun in Japanese mythology, and is the sister of Susanoo and Tsukuyomi.'
      )
    end
    it 'works! (now write some real specs)' do
      get user_post_path(author1, post1)
      expect(response).to have_http_status(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Amaterasu')
    end
  end
end
