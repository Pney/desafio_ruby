class AddTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token_public, :string
    add_index :users, :token_public, unique: true
    add_column :users, :token_private, :string
    add_index :users, :token_private, unique: true
  end
end
