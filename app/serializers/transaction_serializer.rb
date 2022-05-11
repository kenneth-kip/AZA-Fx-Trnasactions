class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :input_amount, :input_currency, :output_amount, :output_currency
end
