class OrdersController < ApplicationController
  before_action :signed_in, only: [:index]

  def index
    @item = Item.find(params[:item_id]) 
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
    @orders = Order.all
    @orders.each do |order|
      if order.item_id == @item.id 
        redirect_to root_path
      end
    end
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
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
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :house_number, :build_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
