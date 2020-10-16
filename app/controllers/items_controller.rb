class ItemsController < ApplicationController

  def index
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
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :value, :category_id, :prefecture_id, :condition_id, :shipping_cost_id, :shipping_day_id, :description, :image).merge(user_id: current_user.id)
  end
end
