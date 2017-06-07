class CreateSwits < ActiveRecord::Migration[5.1]
  def change
    create_table :swits do |t|
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
