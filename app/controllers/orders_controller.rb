class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      # binding.pry
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'orders/index',model: @item
    end
  end

  private

  def order_params
    # binding.pry
    params.require(:order_address).permit(:token, :postal_number, :prefecture_id, :city, :house_number, :build_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    # binding.pry
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
