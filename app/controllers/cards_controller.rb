class CardsController < ApplicationController
  def index
    @cards = Card.all

  end

  def show
    #debugger
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @user = User.find(params[:card][:user_id])
    @card = @user.build_card(card_params)
    @card.save
    redirect_to root_path
  end

  def edit
    #debugger
    @card = Card.find(params[:id])
  end

  def update
    #debugger
    if params[:card][:amount].present?
      @card = Card.find(params[:id])
      @card.amount=@card.amount.to_i+params[:card][:amount].to_i
      @card.update(amount: @card.amount)
      redirect_to root_path
    else
       @card = Card.find(params[:id])
      @card.update(card_params)
      redirect_to root_path
    end
  
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to root_path, status: :see_other
  end
  def pay
  end

  private
    def card_params
      params.require(:card).permit(:student_name,:age,:amount,:user_id)
    end

end
