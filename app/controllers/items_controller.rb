class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_id, :shipping_day_id, :prefecture_id, :price,).merge(user_id: current_user.id)
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
