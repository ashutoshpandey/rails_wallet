class CreateWalletTransactions < ActiveRecord::Migration
  def change
    create_table :wallet_transactions do |t|
      t.integer :wallet_id
      t.integer :user_id
      t.float :amount
      t.string :transaction_type, limit: 20

      t.timestamps null: false
    end
  end
end
