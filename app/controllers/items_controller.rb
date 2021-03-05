class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :unless_redirect, only: [:update] 
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def unless_redirect
    unless current_user == @item.user
     redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_id, :shipping_day_id,
                                 :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
end
