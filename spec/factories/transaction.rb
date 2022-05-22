# User factory
FactoryBot.define do
  factory :transaction do
    customer_id_amount { SecureRandom.uuid }
    input_currency { ['kshs', 'usd'].sample }
    input_amount { [*1000..10000].sample }
    output_currency { 'eur' }
    output_amount { [*1000..10000].sample }
  end
end
