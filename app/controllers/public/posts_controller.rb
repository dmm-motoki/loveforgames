class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(10)
    @comment = current_user.comments.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to public_game_path(@post.game_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_game_path(@post.game.id)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :game_id, tag_ids:[])
  end
end
