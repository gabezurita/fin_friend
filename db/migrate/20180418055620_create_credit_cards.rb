class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.text :description
      t.decimal :apr, default: 0.35
      t.decimal :limit, default: 1000.00
      t.decimal :balance, default: 0
      t.decimal :accrued_interest, default: 0
      t.decimal :payments, default: 0
      t.decimal :charges, default: 0
      t.datetime :created

      t.timestamps
    end
  end
end
