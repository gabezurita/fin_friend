class TransactionsController < ApplicationController
  include TransactionsHelper

  def new
    # @user = User.find(current_user.credit_cards.first.id)
    @credit_card = CreditCard.find(current_user.credit_cards.first.id)
    @transaction = Transaction.new
    @transactions = Transaction.all.where(user_id: current_user.id)
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.credit_cards.first.id)
    @credit_card = CreditCard.find(current_user.credit_cards.first.id)
    @payment = convert_to_debit(transaction_params[:amount])
    @transactions = Transaction.all.where(user_id: current_user.id)
    @transaction = Transaction.new(credit_card_id: @credit_card.id, user_id: @user.id, amount: @payment)

    if @transaction.save
      # If user saves in the db successfully:
      flash[:notice] = 'Transaction successful!'
      redirect_to users_show_path
    else
      @errors = @transaction.errors.full_messages
      render 'new'
    end
  end

  private
def transaction_params
  params.require(:transaction).permit(:amount)
end
end
