# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |_|
  Transaction.create!(
    customer_id: SecureRandom.uuid,
    input_amount: [*1000..10000].sample,
    input_currency: ['eur', 'usd', 'kshs'].sample,
    output_amount: [*1000..10000].sample,
    output_currency: ['eur', 'usd', 'kshs'].sample,
    transaction_date: DateTime.now
  )
end

