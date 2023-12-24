class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit, :update, :destroy]
  before_action :check_login_for_new, only: [:new, :create]

  def index
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).limit(10)
    user_id = params[:user_id]
    if user_id.present?
      begin
        @clicked_user = User.find(user_id)
        @chart_data = @clicked_user.posts.group_by { |post| post.created_at.to_date }.transform_values { |posts| posts.map { |post| { name: post.name, set: post.set.to_f } } }
        @posts = @clicked_user.posts
      rescue ActiveRecord::RecordNotFound
        flash[:error] = "指定されたユーザーが見つかりません。"
        redirect_to root_path
      end
    end
  
    if params[:search]
      search_query = "#{params[:search]}"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
      redirect_to home_path(search: search_query)
    end
  end
  
  def new
    @post = Post.new
    if params[:search]
      search_query = "#{params[:search]}"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
      redirect_to home_path(search: search_query)
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "新規投稿しました。"
      @chart_data ||= {}
      @chart_data[@post.name] = @post.effect.to_f
      redirect_to home_path
    else
      render "new"
    end
    if params[:search]
      search_query = "#{params[:search]}"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
      redirect_to home_path(search: search_query)
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    authorize_user!
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to home_path
    else
      render "edit"
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
  if @post
    @post.destroy
    flash[:notice] = "投稿を削除しました"
  else
    flash[:notice] = "他のユーサーの投稿は消せません"
  end
  redirect_to root_path
  end

  def home
    @users = User.all.order(posts_count: :desc)
    @user = current_user
    @posts = Post.all
    @popular_posts = Post.joins(:favorites).group(:id).order('COUNT(favorites.id) DESC')
  end

  private

  def post_params
    params.require(:post).permit(:name, :set, :introduction, :muscle, :effect)
  end

  def authorize_user!
    @post.user == current_user
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, notice: "ログインしているユーザーのみ投稿一覧を見ることができます。"
    end
  end
  
  def check_login_for_new
    unless user_signed_in?
      flash[:notice] = "ログインしているユーザーのみ記録作成が可能です。"
      redirect_to new_user_session_path
    end
  end
end
