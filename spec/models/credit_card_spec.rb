require 'rails_helper'

RSpec.describe CreditCard, type: :model do

  let!(:credit_card) { CreditCard.create!(created_at: "Sun, 1 Apr 2018 07:29:38 UTC +00:00") }

  let!(:user) { User.create!(name: 'abby', email: 'abby@gmail.com', password: 'password', password_confirmation: 'password') }

  let!(:user_credit_card) { UserCreditCard.create!(credit_card_id: CreditCard.first.id, user_id: User.first.id) }

  let!(:transaction) { Transaction.create!(user_id: User.first.id, credit_card_id: CreditCard.first.id, amount: 500) }

  it 'Has a starting balance of $500' do
    expect(CreditCard.first.transaction_balance).to eq 500
  end

  it 'Has an ending balance of $514.38 after 30 days of daily accrued interest' do
    30.times do
      CreditCard.first.accumulate_daily_accrued_interest
    end

    travel_to Time.zone.local(2018, 4, 31) do
      CreditCard.first.monthly_balance_update!
      expect(CreditCard.first.transaction_balance).to eq 514.38
    end
  end
end

RSpec.describe CreditCard, type: :model do

  let!(:credit_card) { CreditCard.create!(created_at: "Sun, 1 Apr 2018 07:29:38 UTC +00:00") }

  let!(:user) { User.create!(name: 'abby', email: 'abby@gmail.com', password: 'password', password_confirmation: 'password') }

  let!(:user_credit_card) { UserCreditCard.create!(credit_card_id: CreditCard.first.id, user_id: User.first.id) }

  let!(:transaction) { Transaction.create!(user_id: User.first.id, credit_card_id: CreditCard.first.id, amount: 500) }

  it 'Has a starting balance of $500' do
    expect(CreditCard.first.transaction_balance).to eq 500
  end

  it 'Has an ending balance of $411.99 after 30 days of daily accrued interest with several payments' do
    15.times do
      CreditCard.first.accumulate_daily_accrued_interest
    end

    Transaction.create!(user_id: User.first.id, credit_card_id: CreditCard.first.id, amount: -200)

    10.times do
      CreditCard.first.accumulate_daily_accrued_interest
    end

    Transaction.create!(user_id: User.first.id, credit_card_id: CreditCard.first.id, amount: 100)

    5.times do
      CreditCard.first.accumulate_daily_accrued_interest
    end

    travel_to Time.zone.local(2018, 4, 31) do
      CreditCard.first.monthly_balance_update!
      expect(CreditCard.first.transaction_balance).to eq 411.99
    end
  end
end
