class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  before_action :move_to_index_two, only: [:edit]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_index_two
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && @item.user_id == current_user.id
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :delivery_fee_id, :seller_prefecture_id, :shipment_day_id).merge(user_id: current_user.id)
  end
end

