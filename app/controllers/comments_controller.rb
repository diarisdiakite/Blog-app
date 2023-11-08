class CommentsController < ApplicationController
  load_and_authorize_resource

  def destroy
    if can?(:destroy, @comment)
      @comment.destroy
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted'
    else
      redirect_to user_post_path(@user, @post), alert: 'You are not authorized to delete this comment'
    end
  end
end