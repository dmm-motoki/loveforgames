class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
    favorites = FavoriteGame.where(user_id: current_user.id).pluck(:game_id)
    @favorite_games = Game.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  def favorites
    favorites = FavoritePost.where(user_id: current_user.id).pluck(:post_id)
    @favorites_posts = Post.find(favorites)

  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
end
