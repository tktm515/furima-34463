class PurchasesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end

    
  end

  
  private
  def purchase_params
    params.require(:purchase_address).permit(:post_num, :city, :address, :bulding_name, :prefecture_id, :phone_num, ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'                 
    )
  end
  
end
