require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    it '画像が添付されていないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名がないと出品できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明がないと出品できない' do
      @item.detail = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Detail can't be blank"
    end
    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態の情報がないと出品できない' do
      @item.item_condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Item condition can't be blank"
    end
    it '配送料の負担の情報がないと出品できない' do
      @item.delivery_condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery condition can't be blank"
    end
    it '発送元の地域の情報がないと出品できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '発送までの日数の情報がないと出品できない' do
      @item.reach_date_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Reach date can't be blank"
    end
    it '価格の情報がないと出品できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '価格は、¥299以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it '価格は、¥10,000,000以上だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    it '価格は、半角数値でしか出品できない' do
      @item.price = "abc345"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
  end
end