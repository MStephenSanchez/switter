class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :email

      t.timestamps
    end
  end
end
