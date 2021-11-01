class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address) .permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end

end
