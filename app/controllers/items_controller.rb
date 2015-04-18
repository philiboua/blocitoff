class ItemsController < ApplicationController

respond_to :html, :js

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
    else
      flash[:error] = "There was an error deleting the item."
    end

       respond_with(@item) do |f|
        f.html { redirect_to :back }
    end

      #respond_to do |format|
       #format.html
      # format.js
     #end
   end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
