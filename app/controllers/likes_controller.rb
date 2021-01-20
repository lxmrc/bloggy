class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user: current_user) unless already_liked?
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like.destroy if already_liked?
    respond_to do |format|
      format.js
    end
  end

  private

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user: current_user, post: params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
