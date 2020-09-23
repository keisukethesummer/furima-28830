require 'rails_helper'

describe Order do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '正しいクレジットカードの情報で、postal_number、prefecture、city、house_number、phone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'クレジットカード番号が空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'カードの有効期限（年）が空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'カードの有効期限（月）が空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'クレジットカードのセキュリティーコードが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '正しいクレジットカード情報でなければ購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalnumberが空では購入できない' do
        @order_address.postal_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it 'postal_numberはハイフンがなければ購入できない' do
        @order_address.postal_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal number is invalid')
      end
      it 'postal_numberは半角でなければ購入できない' do
        @order_address.postal_number = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal number is invalid')
      end
      it 'prefectureを選択しないと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内でなければは購入できない' do
        @order_address.phone_number = '01234567890123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
