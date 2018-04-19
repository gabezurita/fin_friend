class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name, default: 'FinFriend'
      t.text :description, default: 'With 3 percent cash back on all purchases, this is the best single credit card there is!'
      t.decimal :apr, default: 0.35, precision: 10, scale: 2
      t.decimal :limit, default: 1000.00, precision: 10, scale: 2
      t.decimal :balance, default: 0, precision: 10, scale: 2
      t.decimal :accrued_interest, default: 0, precision: 10, scale: 2
      t.decimal :payments, default: 0, precision: 10, scale: 2
      t.decimal :charges, default: 0, precision: 10, scale: 2
      t.datetime :created

      t.timestamps
    end
  end
end
