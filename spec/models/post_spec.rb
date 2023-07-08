require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "ユーザー情報一覧" do
    let(:user) { User.create(name: "Test User", email: "test@example.com", password: "password") }
    let(:post1) { Post.create(name: "Post 1", set: 10, introduction: "Introduction 1", user: user) }
    let(:post2) { Post.create(name: "Post 2", set: 20, introduction: "Introduction 2", user: user) }
    let(:post3) { Post.create(name: "Post 3", set: 30, introduction: "Introduction 3", user: user) }

    before do
      # テスト用のデータを作成する
      post1
      post2
      post3
      @posts = Post.all
    end

    it "一覧が正しく表示されること" do
      # 期待されるデータを検証する
      expect(@posts.size).to eq(3)
      expect(@posts[0].name).to eq("Post 1")
      expect(@posts[1].name).to eq("Post 2")
      expect(@posts[2].name).to eq("Post 3")
      # ... 他の要素の検証
    end

    it "投稿の件数が正しく表示されること" do
      # 期待されるデータを検証する
      expect(@posts.count).to eq(3)
    end

    it "最新の投稿が一覧の先頭に表示されること" do
      # テスト用のデータを作成する
      post4 = Post.create(name: "Post 4", set: 40, introduction: "Introduction 4", user: user)
      @posts = Post.all.order(created_at: :desc)

      # 期待されるデータを検証する
      expect(@posts.first.name).to eq("Post 4")
    end

    it "特定のユーザーの投稿のみ表示されること" do
      # 別のユーザーを作成して投稿を作成する
      other_user = User.create(name: "Other User", email: "other@example.com", password: "password")
      other_post = Post.create(name: "Other Post", set: 50, introduction: "Introduction 5", user: other_user)

      # 特定のユーザーの投稿のみを取得する
      user_posts = Post.where(user: user)

      # 期待されるデータを検証する
      expect(user_posts.size).to eq(3)
      expect(user_posts).not_to include(other_post)
    end
  end
end
