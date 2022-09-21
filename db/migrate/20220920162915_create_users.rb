class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name_user, null: false
      t.string :email, unique: true, null: false
      t.bigint :phone, null: false
      t.bigint :cpf, unique: true, null: false
      t.string :gender, null: false
      t.string :profile, null: false

      t.timestamps
    end
  end
end
