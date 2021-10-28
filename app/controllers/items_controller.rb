class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if product.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
