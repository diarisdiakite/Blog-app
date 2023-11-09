class CommentsController < ApplicationController
  load_and_authorize_resource

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted.'
    else
      redirect_to user_posts_path(current_user), alert: 'Failed to delete the post.'
    end
  end
end
