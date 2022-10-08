class AddPublicPermissionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :public_permission, :boolean
  end
end
