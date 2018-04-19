class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name, default: 'FinFriend'
      t.text :description, default: 'With 3 percent cash back on all purchases, this is the best single credit card there is!'
      t.decimal :apr, precision: 10, scale: 2, default: 0.35
      t.decimal :limit, precision: 10, scale: 2, default: 1000.00
      t.decimal :balance, precision: 10, scale: 2, default: 0
      t.decimal :accrued_interest, precision: 10, scale: 2, default: 0
      t.decimal :payments, precision: 10, scale: 2, default: 0
      t.decimal :charges, precision: 10, scale: 2, default: 0
      t.datetime :created

      t.timestamps
    end
  end
end
