require 'rails_helper'

describe 'User can sign in using the API' do
  let!(:user) { create(:user) }

  context 'with valid data' do
    it 'logs in' do
      params = {
        email: "user@example.com",
        password: "asdqwe123"
      }

      post api_v1_user_session_path, params: params

      client_id = response.headers['client']
      token = response.headers['access-token']

      expect(response).to be_success
      expect(user.reload.valid_token?(token, client_id)).to be_truthy
    end
  end

  context 'with invalid data' do
    it 'throws an error' do
      params = {
        email: "user@example.com",
        password: "anotvalidpassword"
      }

      post api_v1_user_session_path, params: params

      expect(response).not_to be_success
      expect(json['errors']).to include("Invalid login credentials. Please try again.")
    end
  end
end