class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  # Create method that gets the comments counter for a post.
  def find_comments_count
    comments_counter
  end

  # Create method that gets the likes counter for a post.
  def find_likes_count
    likes_counter
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

        if comment.text.length > 50
          puts "#{truncated_text} ...[Read more], #{comment.created_at}"
        else
          puts "#{comment.text} #{comment.created_at}"
        end
      end
    else
      puts 'There is no recent comment for this post'
    end
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
