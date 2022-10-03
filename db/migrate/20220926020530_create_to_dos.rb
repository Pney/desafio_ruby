class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.references :user, foreign_key: true, optional: false
      t.string  :uni_code
      t.string  :title
      t.text    :description
      t.string  :category
      t.boolean :public_permission

      t.timestamps
    end
  end
end
