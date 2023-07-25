require 'rails_helper'

RSpec.describe Post do
  describe "ユーザー情報一覧" do
    let(:user) { User.create(name: "Test User", email: "test@example.com", password: "password") }
    let(:post1) { described_class.create(name: "Post 1", set: 10, introduction: "Introduction 1", user: user) }
    let(:post2) { described_class.create(name: "Post 2", set: 20, introduction: "Introduction 2", user: user) }
    let(:post3) { described_class.create(name: "Post 3", set: 30, introduction: "Introduction 3", user: user) }

    before do
      post1
      post2
      post3
    end

    it "一覧が正しく表示されること" do
      posts = described_class.all
      expect(posts.size).to eq(3)
    end

    it "投稿の件数が正しく表示されること" do
      posts = described_class.all
      expect(posts.count).to eq(3)
    end

    it "最新の投稿が一覧の先頭に表示されること" do
      post4 = described_class.create(name: "Post 4", set: 40, introduction: "Introduction 4", user: user)
      posts = described_class.all.order(created_at: :desc)
      expect(posts.first.name).to eq("Post 4")
    end

    it "特定のユーザーの投稿のみ表示されること" do
      other_user = User.create(name: "Other User", email: "other@example.com", password: "password")
      other_post = described_class.create(name: "Other Post", set: 50, introduction: "Introduction 5", user: other_user)
      user_posts = described_class.where(user: user)
      expect(user_posts).not_to include(other_post)
    end

    it "特定のユーザーの投稿のみ表示されること (件数)" do
      user_posts = described_class.where(user: user)
      expect(user_posts.size).to eq(3)
    end
  end
end
