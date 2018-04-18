class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.text :description
      t.integercreated :APR
      t.integer :accrued_interest
      t.integer :balance
      t.integer :limit

      t.timestamps
    end
  end
end
