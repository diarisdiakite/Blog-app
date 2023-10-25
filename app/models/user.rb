class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'

  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
