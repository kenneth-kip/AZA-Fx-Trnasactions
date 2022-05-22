require 'rails_helper'

# Test the Transaction API endpoint
RSpec.describe 'Transaction Resource API endpoint', type: :request do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:authorize_request).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'GET - api/v1/transaction' do
    before { create(:transaction, user: user) }

    before do
      get '/api/v1/transactions'
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns 401 status code' do
      expect(json['data'].size).to eq(1)
    end
  end

  describe 'GET - api/v1/transaction/:id' do
    let(:transaction) { create(:transaction, user: user) }

    before do
      get "/api/v1/transactions/#{transaction.id}"
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns 401 status code' do
      expect(json['data']['id']).to eq(transaction.id)
    end
  end

  describe 'POST - api/v1/transaction' do
    let(:body_params) do
      {
        transaction: {
          customer_id: 'satday',
          input_currency: 'usd',
          input_amount: 2000,
          output_currency: 'kshs',
          output_amount: 2001.03,
          transaction_date: '2022-05-06'
        }
      }
    end

    before do
      post '/api/v1/transactions', params: body_params
    end

    it 'returns 201 status code' do
      expect(response).to have_http_status(201)
    end
  end
end
