class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :gender, limit: 6
      t.string :email, limit: 255
      t.string :status, limit:20

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
