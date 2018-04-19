class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :credit_card_id
      t.float :amount

      t.timestamps null: false
    end
  end
end
