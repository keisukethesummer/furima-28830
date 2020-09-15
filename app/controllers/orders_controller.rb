class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
    # binding.pry
    if @order.save
      redirect_to root_path
    else
      redirect_to 'orders/index'
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id, :order_id, :postal_number, :prefecture_id, :city, :house_number, :build_name, :phone_number).merge(user_id: current_user.id)
  end
end
