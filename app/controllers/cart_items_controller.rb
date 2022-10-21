class CartItemsController < ApplicationController
  def index
    @cartitems = CartItem.all
  end
  def show
    @cartitems = CartItem.all
  end

  def create
    #debugger
    @item = Item.find(params[:format])
    @card = Card.find(params[:card_id])
    @cart = Cart.find(params[:cart_id])
    @cartitem = CartItem.create(name: @item.name,price: @item.price,cart_id: current_user.cart.id)
    a = @cart.all_amount.to_i+@cartitem.price
    @cart = @cart.update(all_amount: a)
    redirect_to cart_item_path(@item)
  end

  def destroy
    #debugger
      @cart = Cart.find(params[:cart_id])
      @cartitem = @cart.CartItem.find(params[:id])
      a = @cart.all_amount.to_i - @cartitem.price.to_i
      @cartitem.destroy
      @cart.update(all_amount: a)
      redirect_to cart_item_path(@item)
  end
end
