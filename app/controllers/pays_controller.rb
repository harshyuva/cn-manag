class PaysController < ApplicationController
	def new
		@pay = Pay.new 
	end
	def create
		#debugger
			@card = Card.find(params[:card_id])
			@cart = Cart.find(params[:cart_id])
			@user = User.find(params[:user_id])
	if @card.amount >= @cart.all_amount
			abc = current_user.card.amount-@cart.all_amount.to_i
			@card.update(amount: abc)
		#debugger
			current_user.cart.CartItem.delete_all
			@cart.update(all_amount: 0)
			redirect_to root_path
	else @card.amount.to_i < @cart.all_amount
			flash[:alert] = "add more amount in your card"
			redirect_to root_path
		end
	end

	 private
    def pay_params
      params.require(:pay).permit(:quantity)
    end
end
