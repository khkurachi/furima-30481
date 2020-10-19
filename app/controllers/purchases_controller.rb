class PurchasesController < ApplicationController
  before_action :set_purchase, only: :index
  before_action :move_to_log_in, only: :index
  before_action :move_to_top, only: :index
  def index
    @purchases = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:price)
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_log_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def move_to_top
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
