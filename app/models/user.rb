class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'

  def update_posts_counter
    update(posts_counter: posts.count)
  end

  # Create a method that returns the 3 most recent posts for a given user.
  def list_most_recent_posts
    number_of_posts = 3
    if posts.exists?
      displayed_posts = posts.order(created_at: :desc).limit(number_of_posts)

      if displayed_posts.any?
        puts "Most recent posts for #{user.name}:"
        displayed_posts.each do |post|
          puts "#{post.title}, #{post.created_at}"
        end
      else
        puts 'No posts found'
      end
    else
      puts 'User does not exist'
    end
  end
end
