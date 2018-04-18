class CreditCardsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @interests = Interest.all
  end


  def create
    @credit_card = CreditCard.new(credit_card_params)

    @credit_card.save
    redirect_to @credit_card
  end

  def new
    @user = User.find(params[:user_id])
    @interests = Interest.all
  end

  def create
    @user = User.find(params[:user_id])
    @interests = Interest.all
    if @User.save
      redirect_to(@user)
    else
      @errors = @interest.errors.full_messages
      render 'new'
    end
  end

  private
  def credit_card_params
    params.require(:credit_card).permit(:user, :text)
  end
end
