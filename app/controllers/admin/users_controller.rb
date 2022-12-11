class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def account_stop
    @user = User.find(params[:id])
    @user.update(is_active: false)
    flash[:notice] = "退会しました"
    redirect_to admin_users_path
  end

  def account_start
    @user = User.find(params[:id])
    @user.update(is_active: true)
    flash[:notice] = "退会しました"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction)
  end
end
