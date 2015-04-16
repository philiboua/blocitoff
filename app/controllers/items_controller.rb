class ItemsController < ApplicationController


  def create
    @item = Item.new
    @item = current_user.items.build(item_params)

    if @item.save
       redirect_to :back, notice: "Task was saved successfully."
     else
       flash[:error] = "Error creating task. Please try again."
       redirect_to :back, notice: 'name field empty'
     end
  end

  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
      redirect_to :back
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
