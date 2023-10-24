class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :text
      t.timestamp :updated_at
      t.timestamp :created_at

      t.timestamps
    end
  end
end
