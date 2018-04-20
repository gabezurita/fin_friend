class CreditCardsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @credit_card = CreditCard.new
  end

  def create
    @user = User.find(params[:user_id])
    @credit_card = CreditCard.new

    if @credit_card.save
      redirect_to(@user)
      UserCreditCard.create!(credit_card_id: @credit_card.id, user_id: @user.id)

      # If user saves in the db successfully:
      flash[:notice] = "Enjoy your new card!"
      redirect_to root_path
    else
      @errors = @credit_card.errors.full_messages
      render 'new'
    end
  end
end
