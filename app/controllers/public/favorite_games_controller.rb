class Public::FavoriteGamesController < ApplicationController
  def create
    @game_favorite = FavoriteGame.new(user_id: current_user.id, game_id: params[:game_id])
    @game_favorite.save
    redirect_to request.referer
  end

  def destroy
    @game_favorite = FavoriteGame.find_by(user_id: current_user.id, game_id: params[:game_id])
    @game_favorite.destroy
    redirect_to request.referer
  end
end
