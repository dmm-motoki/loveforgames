class Public::GamesController < ApplicationController
  def index
    @games = Game.all
    @request = Request.new
  end

  def show
    @game = Game.find(params[:id])
    @post = Post.new
    @posts = Post.where(game_id: @game.id)
  end

  private

  def game_params
    params.require(:game).permit(:title, :content)
  end
end
