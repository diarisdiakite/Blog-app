class UsersController < ApplicationController
  # Create an index action
  def index
    @users = User.all
  end

  # Create a show action
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.limit(3)
  end
end
