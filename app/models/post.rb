class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Create method that updates the comments counter for a post.
  def update_comments_counter
    update(comments_counter: comments.count)
  end

  # Create method that updates the likes counter for a post.
  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
