class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    fresh_when etag: @posts, last_modified: @posts.last.created_at
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to current_user
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
      params.require(:post).permit(:title, :content, :image)
    end
end
