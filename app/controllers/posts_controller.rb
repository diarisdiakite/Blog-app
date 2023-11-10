class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_post, only: %i[show destroy like comment]
  # before_action :set_post, only: [:show]

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
    @user = @post.author
    @like = @post.likes
  end

  def like
    authorize! :like, @post, message: 'You are not authorized to like this post.'
    @post = Post.find(params[:id])
    current_user.likes.create(post: @post)
    redirect_to user_post_path(@post.author, @post)
  end

  def comment
    @post = Post.find(params[:id])
    @user = @post.author
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :show
    end
  end

  def destroy
    logger.info 'Am I triggered?'
    @post = current_user.posts.find(params[:id])
    if can?(:destroy, @post)
      @post.destroy
      redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted'
    else
      redirect_to user_posts_path(current_user), alert: 'You are not authorized to delete this post'
    end
  end

  private

  def set_post
    puts "Current User ID: #{current_user.id}"
    @post = current_user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    puts "Post not found for current user with ID #{current_user.id} and post ID #{params[:id]}"
    redirect_to root_path, alert: 'Post not found'
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
