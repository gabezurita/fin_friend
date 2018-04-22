module TransactionsHelper
  def convert_to_debit(amount)
    amount.to_f > 0 ? amount.to_f * -1 : amount.to_f
  end
end
