require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it "nickname、email、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる" do
      end
      it 'passwordが6文字以上であれば登録できる' do
      end
    end


    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下であれば登録できない' do
      end
      it 'passwordが半角英数字でなければ登録できない' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'ユーザー本名の名字が空だと登録できない' do
      end
      it 'ユーザー本名の名前が空だと登録できない' do
      end
      it 'ユーザー本名の名字(カナ)が全角カタカナでなければ登録できない' do
      end
      it 'ユーザー本名の名前(カナ)が全角カタカナでなければ登録できない' do
      end
      it '生年月日が空だと登録できない' do
      end
    end

  
  end
end
