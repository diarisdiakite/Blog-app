class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def find_posts_count
    posts_counter
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
