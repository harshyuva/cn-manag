class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    #debugger
   @item = User.find(1).items
    
  end

  def new
    @item = Item.new
  end

  def create
    #debugger
    @user = User.find(params[:item][:user_id])
    @item = @user.items.create(item_params) 
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :user_id)
    end

end
