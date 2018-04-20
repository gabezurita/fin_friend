class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name, default: 'FinFriend'
      t.text :description, default: 'With 3 percent cash back on all purchases, this is the best single credit card there is!'
      t.float :apr, default: 0.35
      t.float :limit, default: 1000.00
      t.float :accrued_interest, default: 0

      t.timestamps null: false
    end
  end
end
