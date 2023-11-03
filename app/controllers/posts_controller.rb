class PostsController < ApplicationController
  before_action :current_user
  before_action :set_user
  before_action :set_post, only: [:show]

  # Create an index action taking the user id as a parameter
  def index
    @posts = @user.posts
    @comments = []

    @posts.each do |post|
      comments = post.comments.limit(5)
      @comments << comments
    end
  end

  def new
    # @user = User.find(params[:user_id])
    # @user = current_user
    @post = Post.new

    respond_to do |format|
      format.html { render :new, locals: { post: @post, user: @user } }
    end
  end

  def create
    @post = current_user.posts.build(posts_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  # create a show action
  def show
    @post = Post.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    current_user.likes.create(post: @post)
    redirect_to posts_path(@post)
  end

  private

  def set_user
    @user = @current_user
  end

  def current_user
    @current_user ||= User.first
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
