class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
    @followings = @user.followings
    @followers = @user.followers
    favorites = FavoriteGame.where(user_id: @user.id).pluck(:game_id)
    @favorite_games = Game.find(favorites)

    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |anoter|
          if current.room_id ==anoter.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def favorites
    favorites = FavoritePost.where(user_id: current_user.id).pluck(:post_id)
    @favorites_posts = Post.find(favorites)

  end

  def unsubscribe
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email)
  end

end
