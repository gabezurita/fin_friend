class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name, default: 'FinFriend'
      t.text :description, default: 'With 3 percent cash back on all purchases, this is the best single credit card there is!'
      t.float :apr, default: 0.35
      t.float :limit, default: 1000.00
      t.float :balance, default: 0
      t.float :accrued_interest, default: 0
      t.float :payments, default: 0
      t.float :charges, default: 0
      t.datetime :created

      t.timestamps
    end
  end
end
