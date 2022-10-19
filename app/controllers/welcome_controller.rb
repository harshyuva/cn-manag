class WelcomeController < ApplicationController
  def index
    @users = User.all
    @card = Card.all
    @items = Item.all
  end
end
