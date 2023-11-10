module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]

      def index
        # Trying without instance variables
        post_comments = Comment.where(user_id: params[:user_id], post_id: params[:post_id])
        render json: post_comments
      end

      def create
        comment = Comment.new(comment_params)
        if comment.save
          render json: comment, status: :created
        else
          render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:user_id, :post_id, :content)
      end
    end
  end
end
