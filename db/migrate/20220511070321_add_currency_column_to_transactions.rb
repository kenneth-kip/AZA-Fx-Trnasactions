class AddCurrencyColumnToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :input_amount, :decimal, precision: 8, scale: 2
    add_column :transactions, :output_amount, :decimal, precision: 8, scale: 2
    add_column :transactions, :input_currency, :integer, null: false
    add_column :transactions, :output_currency, :integer, null: false
    add_index :transactions, :customer_id

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
