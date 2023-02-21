class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).page(params[:page]).per(10)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  def destroy_in_postshow
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end
end
