class Admin::GamesController < ApplicationController
  def index
    @games = Game.all.page(params[:page]).per(30)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to admin_games_path
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @posts = Post.where(game_id: @game.id).page(params[:page]).per(10)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to admin_game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :content)
  end
end
