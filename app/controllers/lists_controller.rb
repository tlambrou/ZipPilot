class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @items = Item.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(allowed_params)
      redirect_to @list, notice: 'List has been updated'
    else
      render :edit
    end
  end

  private

  def allowed_params
    params.require(:list).permit(:name)
  end
end
