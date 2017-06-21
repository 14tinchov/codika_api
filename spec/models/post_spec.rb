require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post) { create(:post) }

  describe "Validations" do
    it { should validate_presence_of(:title) }
  end

  describe "Factory" do
    it "creates a valid Post" do
      expect(post).to be_valid
    end
  end
end
