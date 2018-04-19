class CreditCardsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @credit_card = CreditCard.new
  end


  # def create
  #   @credit_card = CreditCard.new
  #
  #   @credit_card.save
  #   redirect_to @credit_card
  # end

  # def new
  #   @user = User.find(params[:user_id])
  #   @credit_card = CreditCard.all
  # end

  def create
    @user = User.find(params[:user_id])
    @credit_card = CreditCard.new
    if @user.save
      @credit_card.save
      redirect_to(@user)
    else
      @errors = @credit_card.errors.full_messages
      render 'new'
    end
  end
end
