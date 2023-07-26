class SessionsController < ApplicationController
  def guest_login
    user = User.guest
    sign_in(user)
    redirect_to root_path
    flash[:notice] = "ゲストユーザーとしてログインしました"
  end
end
