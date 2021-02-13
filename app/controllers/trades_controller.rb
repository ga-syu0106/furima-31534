class TradesController < ApplicationController
  before_action :find_item, only:[:index, :create]

  def index
  end

  def create
    @trade_address = TradeAddress.new(address_params)
    if @trade_address.valid?
      pay_item
      @trade_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end
