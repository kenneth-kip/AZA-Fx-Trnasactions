class Transaction < ApplicationRecord
  CURRENCIES = {
    usd: 0,
    eur: 1,
    kshs: 2
  }.freeze

  enum input_currency: CURRENCIES, _prefix: :input_currency
  enum output_currency: CURRENCIES, _prefix: :output_currency

  validates :customer_id, presence: true
  validates :input_amount, presence: true
  validates :transaction_date, presence: true
  validates :output_amount, presence: true
  validates :input_currency, inclusion: { in: CURRENCIES.keys.map(&:to_s)}
  validates :output_currency, inclusion: { in: CURRENCIES.keys.map(&:to_s) }
end
