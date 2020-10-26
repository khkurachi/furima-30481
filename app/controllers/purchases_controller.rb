class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_top, only: :index
  before_action :move_to_top_sold, only: :index
  before_action :move_to_log_in, only: :index
  def index
    @address_purchase = AddressPurchase.new
  end

  def create
    @address_purchase = AddressPurchase.new(address_purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_purchase_params
    params.require(:address_purchase)
    .permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :purchase_id, :user_id, :item_id)
    .merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_log_in
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def move_to_top
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def  move_to_top_sold
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.value,  # 商品の値段
      card: address_purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
