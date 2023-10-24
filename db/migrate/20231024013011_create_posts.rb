class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: true
      t.string :title
      t.string :text
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
