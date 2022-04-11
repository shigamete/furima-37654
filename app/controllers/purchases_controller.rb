class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if (@item.user_id == current_user.id) || Purchase.exists?(item_id: @item.id)
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

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipalitie, :address, :building_name, :phone_number).merge(
      token: params[:token], item_id: @item.id, user_id: current_user.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
