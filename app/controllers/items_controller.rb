class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to items_show_path
    else
      flash [:error] = "There was an error saving the item to the list. Please try again."
      render :new
    end

  end

  def destroy

    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item}\" was deleted successuflly."
      redirect_to items_show_path
    else
      flash[:error] = "There was an error deleting that item."
      redirect_to items_show_path
    end

  end
end
