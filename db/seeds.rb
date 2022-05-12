# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |_|
  Transaction.create!(
    customer_id: SecureRandom.uuid,
    input_amount: [*1000..10000].sample,
    input_currency: 'eur',
    output_amount: [*1000..10000].sample,
    output_currency: 'usd',
    transaction_date: DateTime.now
  )
end

10.times do |_|
  Transaction.create!(
    customer_id: SecureRandom.uuid,
    input_amount: [*1000..10000].sample,
    input_currency: 'eur',
    output_amount: [*1000..10000].sample,
    output_currency: 'kshs',
    transaction_date: DateTime.now
  )
end

10.times do |_|
  Transaction.create!(
    customer_id: SecureRandom.uuid,
    input_amount: [*1000..10000].sample,
    input_currency: 'usd',
    output_amount: [*1000..10000].sample,
    output_currency: 'kshs',
    transaction_date: DateTime.now
  )
end

