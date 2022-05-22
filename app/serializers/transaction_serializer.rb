class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :input_amount_currency, :output_amount_currency, :transaction_date
end
