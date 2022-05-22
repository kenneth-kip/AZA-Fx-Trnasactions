require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe "POST /auth/login" do
    describe 'POST - /auth/login' do
      
      let(:user) { create(:user) }

      let(:body_params) do
        {
          email: user.email,
          password: 'Password1'
        }
      end

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
        post '/auth/login', params: body_params
      end

      it 'returns 200 status code' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
