class CreateLogLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :log_logins do |t|
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
