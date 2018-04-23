class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card


  validate :save_object?
  # byebug
  @transaction_user = User.find(self.user.user_id)

  @transaction_card = @user.credit_cards.first

  private
  def save_object?
    unless valid_transaction?
      errors[:attribute] << "Invalid transaction, your balance must not be less than 0 or greater than 1000"
      return false
    end
  end

  def valid_transaction?
    if (@card.transaction_balance < 0) || (@card.transaction_balance > 1000)
      false
    else
      true
    end
  end
end
