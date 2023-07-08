class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
    @user = User.find(params[:id])
    if current_user.guest? && current_user == @user
      flash[:notice] = 'ゲストユーザーは編集できません。'
      redirect_to user_path(current_user)
    elsif current_user.guest?
      flash[:notice] = 'ゲストユーザーは編集できません。'
      redirect_to root_path
    else
      render :edit
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