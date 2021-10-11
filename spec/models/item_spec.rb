require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it 'delivery_fee_idが空では登録できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee Select')
    end
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it 'delivery_day_idが空では登録できない' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day Select')
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299以下だと登録できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが300ちょうどだと登録できる' do
      @item.price = '300'
      @item.valid?
      expect(@item.errors.full_messages)
    end
    it 'priceが9999999だと登録できる' do
      @item.price = '9999999'
      @item.valid?
      expect(@item.errors.full_messages)
    end
    it 'priceが10000000だと登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが全角だと登録できないこと' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
