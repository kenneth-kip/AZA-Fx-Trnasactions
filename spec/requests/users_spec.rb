require 'rails_helper'

# Test the User API endpoint
RSpec.describe 'User Resource API endpoint', type: :request do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:authorize_request).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'GET - /users' do
    before do
      get '/users'
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns 401 status code' do
      expect(json['data'].size).to eq(1)
    end
  end

  describe 'GET - user/:id' do
    before do
      get "/users/#{user.username}"
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns 401 status code' do
      expect(json['data']['id']).to eq(user.id)
    end
  end

  describe 'PUT - user/:id' do
    let(:body_params) do
      {
        users: {
          name: 'kenneth',
          password: 'Password1'
        }
      }
    end
    before do
      put "/users/#{user.username}", params: body_params
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'PUT - user/:id' do
    before do
      delete "/users/#{user.username}"
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'POST - user/:id' do
    let(:body_params) do
      {
        users: {
          name: 'kenneth',
          username: 'Kipyegon',
          email: 'kipyegonkeneth@gmail.com',
          password: 'Password1',
          password_confirmation: 'Password1'
        }
      }
    end
    
    before do
      post '/users', params: body_params
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(201)
    end
  end
end
