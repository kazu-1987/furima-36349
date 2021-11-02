require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても保存できる' do
        @order_address.building = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages)
      end
    end
    context '購入できない時' do
      it 'userが紐付いてなければと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いてなければと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid"
      end
      it '郵便番号「3桁ハイフン4桁」ではないと登録できない' do
        @order_address.postal_code = '11-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid"
      end
      it '郵便番号はハイフンがないと登録できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid"
      end
      it '都道府県を選択しないと登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が10桁以下では登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が11桁以上では登録できない' do
        @order_address.phone_number = '012345678910'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が半角文字混合だと登録できない' do
        @order_address.phone_number = '090a1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号に-があると登録できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
