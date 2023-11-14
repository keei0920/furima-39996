require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入ができる' do
    it 'すべての配送情報が適切に入力されれば購入できる' do
      expect(@order_address).to be_valid
    end
    it '建物名の入力は任意であること' do
      @order_address.building_name = nil
      @order_address.valid?
      expect(@order_address).to be_valid
    end
  end

  describe '商品の購入ができない' do
    it '郵便番号がないと保存できない' do
      @order_address.post_number = " "
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Post number can't be blank"
    end
    it '郵便番号は、全角を含んだ文字列だと保存できない' do
    @order_address.post_number = "５６５-3456"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
    end
    it '郵便番号は、ハイフンを含んでいないと保存できない' do
      @order_address.post_number = "5653456"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Post number is invalid. Include hyphen(-)"
    end
    it '都道府県を選択していないと保存できない' do
      @order_address.prefecture_id = "0"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '市区町村を入力していないと保存できない' do
      @order_address.municipality = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
    end
    it '番地を入力していないと保存できない' do
      @order_address.street_address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Street address can't be blank"
    end
    it '電話番号がないと保存できない' do
      @order_address.tel_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Tel number can't be blank"
    end
    it '電話番号は、９桁未満の半角数値だと保存できない' do
      @order_address.tel_number = 123456789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Tel number is invalid"
    end
    it '電話番号は、12桁以上の半角数値だと保存できない' do
      @order_address.tel_number = 123456789012
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Tel number is invalid"
    end
    it '電話番号は、ハイフンを含んでいると保存できない' do
      @order_address.tel_number = '080-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Tel number is invalid"
    end
    it 'userが紐づいていないと保存できない' do
      @order_address.user_id = " "
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "User can't be blank"
    end
    it 'itemが紐づいていないと保存できない' do
      @order_address.item_id = " "
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Item can't be blank"
    end
  end
end
