class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

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
      redirect_to posts_path
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    authorize_user!
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
    @post = Post.find(params[:id])
    unless authorize_user!
      flash[:notice] = "他のユーザーの投稿は削除できません"
      redirect_to posts_path and return
    end

    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :set, :introduction,:muscle)
  end

  def authorize_user!
    @post.user == current_user
  end


  
end
