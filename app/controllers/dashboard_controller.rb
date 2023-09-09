class DashboardController < ApplicationController
  def index
    if params[:search]
      search_query = "#{params[:search]}"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
      redirect_to home_path(search: search_query)
    end
  end

  def show
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).limit(10)
    @chart_data = @user.posts.group_by { |post| post.created_at.to_date }.transform_values { |posts| posts.map { |post| { name: post.name, set: post.set.to_f } } }
    if params[:search]
      search_query = "#{params[:search]}"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
      redirect_to home_path(search: search_query)
    end
  end
end
