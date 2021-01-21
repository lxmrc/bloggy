class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @posts = @user.posts.reverse
  end
end
