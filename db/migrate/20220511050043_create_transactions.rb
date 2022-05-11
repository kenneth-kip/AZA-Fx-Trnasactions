class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :customer_id, null: false
      t.datetime :transaction_date
    end
  end
end
