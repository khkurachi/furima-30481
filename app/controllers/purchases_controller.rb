class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.new
    @item = Item.find(params[:item_id])

  end
end
