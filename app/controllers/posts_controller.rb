class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit, :update, :destroy]
  before_action :check_login_for_new, only: [:new, :create]

  def index
    if params[:search]
      search_query = "%#{params[:search]}%"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
    else
      @posts = Post.all
    end
    @popular_posts = Post.joins(:favorites).group(:id).order('COUNT(favorites.id) DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "新規投稿しました。"
      @chart_data ||= {}
      @chart_data[@post.name] = @post.effect.to_f
      redirect_to posts_path
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
  if @post.nil?
    flash[:notice] = "他のユーサーの投稿は編集できません"
    redirect_to root_path
  end
  end

  def update
    @post = Post.find(params[:id])
    authorize_user!
    if @post.update(post_params)
      flash[:notice] = "ユーザーIDが「#{@post.id}」の情報を更新しました"
      redirect_to posts_path
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
