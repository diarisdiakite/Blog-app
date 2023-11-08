class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
  end
end
