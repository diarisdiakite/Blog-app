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

  # Create a method which returns the 5 most recent comments for a given post.
  def find_most_recent_comments(post_id)
    number_of_comments = 5
    post = Post.find(post_id)

    if post.comments.exists?
      displayed_comments = comments.order(created_at: :desc).limit(number_of_comments)
      puts "Most recent comments for post #{post.title}"

      displayed_comments.each do |comment|
        truncated_text = comment.text[0, 50]
        comment.text

        if comment.text.length > 50
          puts "#{truncated_text} ...[Read more], #{comment.created_at} "
        else
          puts "#{comment.text} #{comment.created_at}"
        end
      end
    else
      puts 'There is no recent comment for this post'
    end
  end
end
