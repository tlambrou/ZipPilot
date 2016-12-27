class ItemsController < ApplicationController
  def index
    @list = List.find(params[:list_id]).order("published_at DESC")
    @item = Item.all
  end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to @list
      flash[:notice] = "Item saved successfully."
    else
      redirect_to @list
      flash[:error] = "Item could not be saved."
    end
  end

  def show

    @item = Item.find(params[:id])

    # @comment = @post.comments.new
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :rank, :note, :list_id)
    end
end
