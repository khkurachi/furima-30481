class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :sign_in, :log_in, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
        @item.save
         redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id]) 
    if @item.update(item_params)
        redirect_to item_path(item.id), method: :get
      else
        render :edit
      end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :value, :category_id, :prefecture_id, :condition_id, :shipping_cost_id, :shipping_day_id, :description, :image).merge(user_id: current_user.id)
  end
end
