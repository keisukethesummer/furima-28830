require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/fixtures/sample.png')
  end

  describe '商品出品' do
    context '出品がうまく行く時' do
      it 'image,name,description,category_id,condition_id,delivery_fee_id,seller_prefecture_id,shipment_day_id,priceが入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまく行かない時' do
      it '画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーを選択しないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態を選択しないと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担を選択しないと出品できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.seller_prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Seller prefecture must be other than 0')
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.shipment_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment day must be other than 1')
      end
      it '価格についての情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間でなければ出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は半角数字出なければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
