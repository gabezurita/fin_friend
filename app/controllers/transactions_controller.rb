class TransactionsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @credit_card = CreditCard.find(params[:user_id])
    @transaction = Transaction.new(transaction_params)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @user = User.find(params[:user_id])
    @credit_card = CreditCard.find(params[:credit_card_id])

    if @transaction.save
      redirect_to(@user)

      # If user saves in the db successfully:
      flash[:notice] = 'Transaction successful!'
      redirect_to root_path
    else
      @errors = @transaction.errors.full_messages
      render 'new'
    end
  end

private

  def transaction_params
    params.require(:transaction).permit(:amount, :user_id, :credit_card_id)
  end
end
