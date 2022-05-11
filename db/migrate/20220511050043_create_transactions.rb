class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :customer, index: true
      t.datetime :transaction_date
    end
  end
end
