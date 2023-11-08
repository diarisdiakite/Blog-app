class PostsController < ApplicationController
  before_action :current_user
  before_action :set_user
  before_action :set_post, only: [:show]

  # Create an index action taking the user id as a parameter
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts
    @comments = @posts.map { |post| post.comments.limit(5) }
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post was successfully created'
    else
      render :new
    end
  end

  # create a show action
  def show
    @post = Post.find(params[:id])
    @like = @post.likes
  end

  def like
    @post = Post.find(params[:id])
    current_user.likes.create(post: @post)
    redirect_to user_post_path(@user, @post)
  end

  def comment
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :show
    end
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

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
