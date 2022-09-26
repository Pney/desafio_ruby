class CreateLogLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :log_logins do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
