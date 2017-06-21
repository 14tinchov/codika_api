require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should allow_value('example@domain.com').for(:email) }
  end

  describe "Factory" do
    it "creates a valid user" do
      expect(user).to be_valid
    end
  end
end
