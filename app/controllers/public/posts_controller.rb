class Public::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to public_game_path(@post.game_id)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :game_id)
  end
end
