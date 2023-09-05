class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if params[:search]
      search_query = "#{params[:search]}"
      @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
      redirect_to home_path(search: search_query)
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.guest? && current_user == @user
      flash[:notice] = 'ゲストユーザーは編集できません.'
      redirect_to user_path(current_user)
    elsif current_user.guest?
      flash[:notice] = 'ゲストユーザーは編集できません.'
      redirect_to root_path
    else
      if params[:search]
        search_query = "#{params[:search]}"
        @posts = Post.where("name LIKE ? OR muscle LIKE ?", search_query, search_query)
        redirect_to home_path(search: search_query)
      else
        render :edit
      end
    end
  end
  
    
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user),notice: "ユーザー情報を更新しました。"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image_id)
  end

  def account
  end

  
end