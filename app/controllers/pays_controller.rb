class PaysController < ApplicationController
	def new
		@pay = Pay.new 
	end
	def create
		#debugger
			@item = Item.find(params[:pay][:item_id])
			@card = Card.find(params[:pay][:card_id])
	if @card.amount >= params[:pay][:quantity].to_i*@item.price.to_i
			@pay = Pay.create(pay_params)
			@item = Item.find(params[:pay][:item_id])
			@card = Card.find(params[:pay][:card_id])
			abc = current_user.card.amount-params[:pay][:quantity].to_i*@item.price.to_i
			@card.update(amount: abc)
			redirect_to root_path
	else @card.amount.to_i < params[:pay][:quantity].to_i
			flash[:alert] = "abbe garib aadmi"
			redirect_to root_path
		end
	end

	 private
    def pay_params
      params.require(:pay).permit(:quantity)
    end
end
