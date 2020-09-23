class OrdersController < ApplicationController
  before_action :signed_in, only: [:index]
  before_action :set_item, only: [:index, :create, :pay_item]


  def index
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id || @item.order != nil
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'orders/index', model: @item
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :house_number, :build_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
