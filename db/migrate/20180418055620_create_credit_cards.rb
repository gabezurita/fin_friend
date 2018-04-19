class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.text :description
      t.decimal :apr
      t.decimal :limit
      t.integer :balance
      t.integer :accrued_interest
      t.integer :payments
      t.integer :charges
      t.datetime :created

      t.timestamps
    end
  end
end
