class PostsController < ApplicationController
  def index
    @posts = @cache || update_cache
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
    update_cache
    redirect_to current_user
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      update_cache
      redirect_to current_user
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to current_user
    flash[:notice] = "Post deleted."
  end

  private

    def update_cache
      @cache = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
