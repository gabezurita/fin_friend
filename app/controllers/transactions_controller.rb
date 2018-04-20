class TransactionsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @credit_card = CreditCard.find(current_user.credit_cards.first.id)
    @transaction = Transaction.new
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.credit_cards.first.id)
    @credit_card = CreditCard.find(current_user.credit_cards.first.id)
    @transaction = Transaction.new(credit_card_id: @credit_card.id, user_id: @user.id, amount: amount)

    if @transaction.save
      redirect_to users_show_path

      # If user saves in the db successfully:
      flash[:notice] = 'Transaction successful!'
      redirect_to users_show_path
    else
      @errors = @transaction.errors.full_messages
      render 'new'
    end
  end
end
