class CreditCard < ApplicationRecord
  has_many :transactions

  has_many :user_credit_cards
  has_many :users, through: :user_credit_cards

  def created_this_month?
    created_at.month == Time.now.month && created_at.year == Time.now.year
  end

  def start_of_month
    Time.now.utc.start_of_month
  end

  def end_of_month
    Time.now.utc.at_end_of_month
  end

  def current_day_of_month
    Time.now.day
  end

  def total_days_in_current_month
    Time.now.end_of_month.day
  end

  def transaction_balance
    transactions.inject(0) { |sum, t| sum + t.amount }
  end

  def daily_interest_rate
    apr / 365
  end

  def daily_accrued_interest
    (transaction_balance * daily_interest_rate)
  end

  def accumulate_daily_accrued_interest
    return if self.created_at.to_date == Time.now.to_date
    self.accrued_interest += daily_accrued_interest
    self.save!
  end

  def monthly_balance_update!(current_time = nil)
    current_time ||= Time.now
    return unless current_time == end_of_month
    Transaction.create!(user_id: self.users.first.id, credit_card_id: self.id, amount: self.accrued_interest)
    self.accrued_interest = 0
    self.save!
  end
end
