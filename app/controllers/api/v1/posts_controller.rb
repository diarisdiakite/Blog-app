module Api
  module V1
    class PostsController < ApplicationController
      def index
        @user_posts = Post.where(author_id: params[:user_id])
        render json: @user_posts
      end

      def show
        @post = Post.find(params[:id])
        @user = @post.author
        @like = @post.likes

        render json: @post
      end
    end
  end
end
