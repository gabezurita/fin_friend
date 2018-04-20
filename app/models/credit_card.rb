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

  def daily_interest_rate
    apr.to_f / 365.to_f
  end

  def daily_accrued_interest
    (balance.to_f * daily_interest_rate.to_f) / 100.to_f
  end

  def total_accrued_interest
    if created_this_month?
      daily_accrued_interest * (current_day_of_month - created_at.day)
    else
      daily_accrued_interest * current_day_of_month
    end
  end

  def apply_interest_to_balance!(current_time = nil)
    current_time ||= Time.now
    return unless current_time == end_of_month
    @balance += total_accrued_interest
    @balance.save!
  end

  def pay_balance(paid_amount)
    @balance -= paid_amount
    @balance.save!
  end

  def charge_card(charged_amount)
    @balance += charged_amount
    @balance.save!
  end
end
