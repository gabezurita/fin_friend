class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.text :description
      t.decimal :apr
      t.decimal :limit
      t.decimal :balance
      t.decimal :accrued_interest
      t.decimal :payments
      t.decimal :charges
      t.datetime :created

      t.timestamps
    end
  end
end
