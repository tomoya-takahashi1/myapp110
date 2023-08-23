class DashboardController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).limit(10)
    @chart_data = @user.posts.group_by { |post| post.created_at.to_date }.transform_values { |posts| posts.map { |post| { name: post.name, set: post.set.to_f } } }
  end
end
