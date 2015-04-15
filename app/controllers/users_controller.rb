class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  @user = User.find(params[:id] || current_user.id)
  @item = Item.new
  @items = current_user.items

 # @item = @user.items.find(params[:item_id])
  end
end
