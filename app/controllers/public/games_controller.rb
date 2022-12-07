class Public::GamesController < ApplicationController
  def index
    @games = Game.all
    @request = Request.new
  end

  def show
    @game = Game.find(params[:id])
    @tags = Tag.all
    @post = Post.new
    if params[:search].present?
      @posts = Post.where("message LIKE ?", '%' + params[:search] + '%').where(game_id: @game.id)
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.where(game_id: @game.id)
    else
      @posts = Post.where(game_id: @game.id)
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :content)
  end
end
