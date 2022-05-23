# User factory
FactoryBot.define do
  factory :transaction do
    customer_id { SecureRandom.uuid }
    input_currency { ['kshs', 'usd'].sample }
    input_amount { [*1000..10000].sample }
    output_currency { 'eur' }
    output_amount { [*1000..10000].sample }
    transaction_date { DateTime.now }
    user
  end
end
