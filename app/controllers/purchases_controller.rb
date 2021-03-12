class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :purchase_redirect, only: [:index, :create]
  before_action :if_redirect, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
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

  def purchase_redirect
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end

  def if_redirect
    if current_user == @item.user
      redirect_to root_path
    end
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
