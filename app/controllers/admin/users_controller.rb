class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "アカウントデータが削除されました"
    redirect_to admin_users_path
  end

  def account_stop
    @user = User.find(params[:id])
    @user.update(is_active: false)
    flash[:notice] = "アカウント停止しました。"
    redirect_to admin_users_path
  end

  def account_start
    @user = User.find(params[:id])
    @user.update(is_active: true)
    flash[:notice] = "アカウント始動しました。"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction)
  end
end
