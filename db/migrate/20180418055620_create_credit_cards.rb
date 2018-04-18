class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.text :description
      t.integer :APR
      t.integer :accrued_interest
      t.integer :balance
      t.integer :limit
      t.datetime :created

      t.timestamps
    end
  end
end
