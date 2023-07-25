require 'rails_helper'

RSpec.describe "Posts", request: true do
let(:user) { User.create(name: "Test User", email: "test@example.com", password: "password") }
let(:post) { Post.create(name: "Test Post", set: 20, introduction: "This is a test post", user: user) }

  describe "GET /posts" do
    before do
      user 
      post 
      sign_in user 
      get posts_path
    end

    it 'カテゴリーページが正常に表示されること' do
      expect(response).to have_http_status(:ok)
    end

    it '投稿が表示されること' do
      expect(response.body).to include(post.name)
    end

    it 'ユーザー情報が表示されること' do
      expect(response.body).to include(user.name)
    end
  end
end
