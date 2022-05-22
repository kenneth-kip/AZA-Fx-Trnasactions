class Transaction < ApplicationRecord
  include Filterable
  include ActionView::Helpers::NumberHelper

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
  validates :input_currency, inclusion: { in: CURRENCIES.keys.map(&:to_s) }
  validates :output_currency, inclusion: { in: CURRENCIES.keys.map(&:to_s) }
  validates :input_amount, numericality: { greater_than: 0.0 }
  validates :output_amount, numericality: { greater_than: 0.0 }
  validate :validate_currency

  scope :filter_by_input_currency, ->(currency) { where(input_currency: currency) }
  scope :filter_by_output_currency, ->(currency) { where(output_currency: currency) }
  scope :filter_by_customer_id, ->(customer_id) { where(customer_id: customer_id) }

  def self.filter_by_transaction_date(date)
    begin
      date_details = JSON.parse date
      start_date = date_details['gt'] ? date_details['gt'].to_datetime : nil
      end_date = date_details['lt'] ? date_details['lt'].to_datetime : nil
      where(transaction_date: start_date..end_date)
    rescue JSON::ParserError
      where(transaction_date: date.to_date)
    end
  end

  def self.filter_by_input_amount(amount)
    begin
      amount_details = JSON.parse amount
      start_amount = amount_details['gt']
      end_amount = amount_details['lt']
      where(input_amount: start_amount..end_amount)
    rescue JSON::ParserError
      where(input_amount: amount)
    end
  end

  def self.filter_by_output_amount(amount)
    begin
      amount_details = JSON.parse amount
      start_amount = amount_details['gt']
      end_amount = amount_details['lt']
      where(output_amount: start_amount..end_amount)
    rescue JSON::ParserError
      where(output_amount: amount)
    end
  end

  def input_amount_currency
    number_to_currency(read_attribute(:input_amount), unit: input_currency.upcase, format: "%n %u")
  end

  def output_amount_currency
    number_to_currency(read_attribute(:output_amount), unit: output_currency.upcase, format: "%n %u")
  end

  private

  def validate_currency
    if input_currency == output_currency
      errors.add(:base, 'Input and Output currency cannot be the same')
    end
  end
end
