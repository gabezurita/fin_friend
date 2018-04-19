class UserCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_credit_cards do |t|
      t.integer :user_id
      t.integer :credit_card_id

      t.timestamps null: false
  end
end
