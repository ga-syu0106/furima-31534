class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
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
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params_item)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :category_id, :explanation, :state_id, :delivery_free_id, :prefecture_id,
                                 :days_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
