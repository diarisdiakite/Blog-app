module Api
  module V1
    class PostsController < ApplicationController
      def index
        @user_posts = Post.where(author_id: params[:user_id])
        render json: @user_posts
      end
    end
  end
end
