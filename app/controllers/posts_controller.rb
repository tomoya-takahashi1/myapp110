class PostsController < ApplicationController
  def index
    if params[:search]
      @posts = Post.where("name LIKE ?", "%#{params[:search]}%")
    else
      @posts = Post.all
    end
  end
  
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:name, :set, :introduction))
    @post.user_id = current_user.id
     if @post.save
      flash[:notice] = "新規投稿しました。"
       redirect_to :posts
     else
       render "new"
     end
  end

  def show
    @post = Post.find(params[:id])
   
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if @post.update(params.require(:post).permit(:name,  :set, :introduction))
       flash[:notice] = "ユーザーIDが「#{@post.id}」の情報を更新しました"
       redirect_to :posts
     else
       render "edit"
     end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :posts
  end
  
end
