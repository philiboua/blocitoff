class ItemsController < ApplicationController
  def create
    @item = current_user.items.create(item_params)

    if @item.save
       redirect_to user_path(current_user), notice: "Task was saved successfully."
     else
       flash[:error] = "Error creating task. Please try again."
       redirect_to user_path(current_user), notice: 'name field empty'
     end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error deleting the item."
      render :show
     end
   end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
