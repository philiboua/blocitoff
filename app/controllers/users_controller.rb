class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
  @item = Item.new
  @items = current_user.items

 # @item = @user.items.find(params[:item_id])
  end
end
