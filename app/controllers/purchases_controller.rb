class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
    @item = Item.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
  end


  private
  def purchase_params
    params.require(:purchase).permit(:item_id).merge(user_id: current_user.id, token: params[:token])
  end
end
