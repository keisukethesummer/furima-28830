class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'orders/index',model: @item
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:price, :token, :user_id, :item_id, :order_id, :postal_number, :prefecture_id, :city, :house_number, :build_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
