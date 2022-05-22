require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should validate_numericality_of(:output_amount) }

  it { should validate_numericality_of(:input_amount) }

  it { should validate_presence_of(:input_amount) }

  it { should validate_presence_of(:output_amount) }

  it { should validate_presence_of(:customer_id) }

  it { should validate_presence_of(:transaction_date) }

  it { should define_enum_for(:output_currency).with_values(usd: 0, eur: 1, kshs: 2).with_prefix(:output_currency) }

  it { should define_enum_for(:input_currency).with_values(usd: 0, eur: 1, kshs: 2).with_prefix(:input_currency) }
end
