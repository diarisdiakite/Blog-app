class AddIndexesToPostsCommentsAndLikes < ActiveRecord::Migration[7.0]
  def change
    unless index_exists?(:comments, :user_id)
      add_index :comments, :user_id
    end
    
    unless index_exists?(:comments, :post_id)
      add_index :comments, :post_id
    end

    unless index_exists?(:likes, :user_id)
      add_index :likes, :user_id
    end

    unless index_exists?(:likes, :post_id)
      add_index :likes, :post_id
    end

    unless index_exists?(:posts, :author_id)
      add_index :posts, :author_id
    end
  end
end
