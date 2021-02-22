require 'rails_helper'

RSpec.describe TradeAddress, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @trade_address = FactoryBot.build(:trade_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '保存がうまくいくとき' do
      it '全てが正しく入力してあれば保存できること' do
        expect(@trade_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @trade_address.building_name = nil
        expect(@trade_address).to be_valid
      end
    end

    context '保存ができないとき' do
      it 'トークンが空では保存できないこと' do
        @trade_address.token = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がからでは保存できないこと' do
        @trade_address.postal_code = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが入力されていないと保存できないこと' do
        @trade_address.postal_code = '1234567'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include('Postal code 半角数字のみで (-) も入力してください')
      end

      it '郵便番号は半角数字で入力されていないと保存できないこと' do
        @trade_address.postal_code = '１２３-４５６７'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include('Postal code 半角数字のみで (-) も入力してください')
      end

      it '都道府県が選択されていないと保存できないこと' do
        @trade_address.prefecture_id = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が入力されていないと保存できないこと' do
        @trade_address.municipality = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が入力されていないと保存できないこと' do
        @trade_address.address = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @trade_address.phone_number = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は半角数字でないと保存できないこと' do
        @trade_address.phone_number = '０９０１２３４５６７８'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include('Phone number 半角数字で入力してください')
      end

      it '電話番号は英数混合で入力されていると保存できないこと' do
        @trade_address.phone_number = '090912345abc'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include('Phone number 半角数字で入力してください')
      end

      it '電話番号が11文字以内でないと保存できないこと' do
        @trade_address.phone_number = '0909123456789'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it '購入者情報が紐づいてないと保存できないこと' do
        @trade_address.user_id = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("User can't be blank")
      end

      it '販売商品情報が紐づいてないと保存できないこと' do
        @trade_address.item_id = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
