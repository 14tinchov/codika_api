require 'rails_helper'

describe 'User can sign in using the API' do

  context 'with valid data' do
    it 'logs in' do
      params = {
        email: "user2@example.com",
        password: "password123",
        password_confirmation: "password123"
      }

      expect {
        post api_v1_user_registration_path, params: params
      }.to change { User.count }.by(1)

      expect(response).to be_success
      expect(User.last.email).to eq("user2@example.com")
    end
  end
end