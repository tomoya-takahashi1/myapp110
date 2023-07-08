require 'rails_helper'

RSpec.describe "Posts", type: :request do
let(:user) { User.create(name: "Test User", email: "test@example.com", password: "password") }
let(:post) { Post.create(name: "Test Post", set: 20, introduction: "This is a test post", user: user) }

  describe "GET /posts" do
    before do
      user # テスト用のユーザーデータを作成
      post # テスト用の投稿データを作成
      sign_in user # ユーザーをログインさせる
      get posts_path
    end
    
    it 'カテゴリーページが正常に表示されること' do
      expect(response).to have_http_status(200)
    end
    it '投稿が表示されること' do
      expect(response.body).to include(post.name)
    end

    it 'ユーザー情報が表示されること' do
      expect(response.body).to include(user.name)
    end

    it '投稿作成リンクが表示されること' do
      expect(response.body).to include('<a href="/posts/new">記録作成</a>')

    end

    it '投稿編集リンクが表示されること' do
      expect(response.body).to include("<a href=\"/posts/#{post.id}/edit\">編集</a>")
    end

    it '投稿削除リンクが表示されること' do
      expect(response.body).to include("<a href=\"/posts/#{post.id}\" data-method=\"delete\">削除</a>")
    end
  end
end
