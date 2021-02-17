class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :destroy, :update]
  before_action :check_trade, only: [:edit, :destroy, :update]

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
  end

  def edit
  end

  def update
    if @item.update(params_item)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
  end

  private

  def params_item
    params.require(:item).permit(:name, :category_id, :explanation, :state_id, :delivery_free_id, :prefecture_id,
                                 :days_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path unless @item.user.id == current_user.id
  end

  def check_trade
    redirect_to root_path unless @item.trade == nil
  end
  
end
