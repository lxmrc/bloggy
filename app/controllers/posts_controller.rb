class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to current_user
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to current_user
    flash[:notice] = "Post deleted."
  end

  private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
