class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name_user
      t.string :email
      t.bigint :phone
      t.bigint :cpf
      t.string :gender
      t.string :profile

      t.timestamps
    end
  end
end
