class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :input_amount, :output_amount, :transaction_date
end
