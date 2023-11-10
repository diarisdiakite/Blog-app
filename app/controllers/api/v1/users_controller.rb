module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        @posts = @user.posts.limit(3)

        render json: @user
      end
    end
  end
end
