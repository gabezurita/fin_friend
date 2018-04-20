require 'rails_helper'

RSpec.describe CreditCard, type: :model do

  let!(:credit_card) { CreditCard.create! }

  let!(:user) { User.create!(name: 'abby', email: 'abby@gmail.com', password: 'password', password_confirmation: 'password') }

  let!(:user_credit_card) { UserCreditCard.create!(credit_card_id: CreditCard.first.id, user_id: User.first.id) }

  let!(:transaction) { Transaction.create!(user_id: User.first.id, credit_card_id: CreditCard.first.id, amount: 500) }

  it 'Has a starting balance of $500' do
    expect(CreditCard.first.transaction_balance).to eq 500
  end
end
