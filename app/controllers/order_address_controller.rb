class OrderAddresesController < ApplicationController
  def index
    @order = Order.all
  end
  
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :order)
  end

end