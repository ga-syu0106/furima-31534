require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    it '全てが正しく入力してあれば出品できること' do
      expect(@item).to be_valid
    end

    it '商品画像が１枚ないと出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空だと出品できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空だと出品できないこと' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報が空だと出品できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品状の状態についての情報が空だと出品できないこと' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end

    it '配送料の負担についての情報が空だと出品できないこと' do
      @item.delivery_free_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery free can't be blank")
    end

    it '発送元の地域についての情報が空だと出品できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数ついての情報が空だと出品できないこと' do
      @item.days_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days ship can't be blank")
    end

    it '  価格についての情報が空だと出品できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間でないと出品できないこと(300円未満)' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字で300円〜9,999,999円の間で入力ください')
    end

    it '価格の範囲が、¥300~¥9,999,999の間でないと出品できないこと(9,999,999円より大きい)' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字で300円〜9,999,999円の間で入力ください')
    end

    it '販売価格は半角数字でないと出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字で300円〜9,999,999円の間で入力ください')
    end

    it 'ユーザーと紐付いていないと出品できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
