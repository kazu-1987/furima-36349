class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end


  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(order_id: @order.id)
  end
end

