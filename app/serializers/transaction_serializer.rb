class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :input_amount_with_currency, :output_amount_with_currency, :transaction_date

  link(:self) { api_v1_transaction_path(object.id) }
end
