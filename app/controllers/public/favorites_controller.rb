class Public::FavoritesController < ApplicationController
  def create
    @post_favorite = FavoritePost.new(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_to request.referer
  end

  def destroy
    @post_favorite = FavoritePost.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_to request.referer
  end
end
