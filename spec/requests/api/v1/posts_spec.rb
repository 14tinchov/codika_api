require 'rails_helper'

describe "Posts API" do
  let!(:user)         { create(:user) }
  let!(:post_model)   { create(:post) }
  let!(:post_model_2) { create(:post) }

  context "with user logged in" do
    it "GET #index returns http success" do
      get api_v1_posts_path, headers: logged_in_headers

      expect(response).to have_http_status(:success)
      expect(json['posts']).to be_present
      expect(json['posts'].count).to be > 1
      expect(json['posts'].first["title"]).to eq(post_model.title)
    end

    it "GET #show returns http success" do
      get api_v1_post_path(post_model.id), headers: logged_in_headers

      expect(response).to have_http_status(:success)
      expect(json['id']).to be_present
      expect(json['title']).to be_present
      expect(json['body']).to be_present
    end
  end

  context "with user not logged in" do
    it "GET #index returns http error" do
      get api_v1_posts_path

      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to include("You need to sign in or sign up before continuing.")
    end

    it "GET #show returns http error" do
      get api_v1_post_path(post_model.id)

      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to include("You need to sign in or sign up before continuing.")
    end
  end
end
