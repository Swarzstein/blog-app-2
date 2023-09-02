require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    let!(:author1) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
    it 'works! (now write some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include('Akai321')
    end
  end

  describe 'GET /users/1' do
    let!(:author1) { User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist') }
    it 'works! (now write some real specs)' do
      get user_path(author1)
      expect(response).to have_http_status(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include('Akai321')
    end
  end
end
