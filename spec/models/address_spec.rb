require 'rails_helper'
RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目が入力されていれば保存できる' do
        expect(@address).to be_valid
      end
      it '建物名がなくても保存できる' do
        @address.building = ''
        @address.valid?
        expect(@address.errors.full_messages)
      end
    end
    context '購入できない時' do
      it '郵便番号が空では登録できない' do
        @address = FactoryBot.build(:address)
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '郵便番号「3桁ハイフン4桁」ではないと登録できない' do
        @address = FactoryBot.build(:address)
        @address.postal_code = '11-111'
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '郵便番号はハイフンがないと登録できない' do
        @address = FactoryBot.build(:address)
        @address.postal_code = '1111111'
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '都道府県を選択しないと登録できない' do
        @address = FactoryBot.build(:address)
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '市町村が空では登録できない' do
        @address = FactoryBot.build(:address)
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '番地が空では登録できない' do
        address = FactoryBot.build(:address)
        address.house_number = ''
        address.valid?
        expect(address.errors.full_messages).to include "Order must exist"
      end
      it '電話番号が空では登録できない' do
        @address = FactoryBot.build(:address)
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '電話番号が10桁以下では登録できない' do
        @address = FactoryBot.build(:address)
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '電話番号が11桁以上では登録できない' do
        @address = FactoryBot.build(:address)
        @address.phone_number = '012345678910'
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '電話番号が半角文字混合だと登録できない' do
        @address = FactoryBot.build(:address)
        @address.phone_number = '090a1231234'
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
      it '電話番号に-があると登録できない' do
        @address = FactoryBot.build(:address)
        @address.phone_number = '090-1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include "Order must exist"
      end
    end
  end
end
