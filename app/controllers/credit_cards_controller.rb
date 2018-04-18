class CreditCardsController < ApplicationController
  def new
  end


  def create
    @credit_card = CreditCard.new(params[:credit_card])

    @credit_card.save
    redirect_to @credit_card
  end
end
