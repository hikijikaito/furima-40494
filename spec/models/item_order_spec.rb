require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入者情報の保存' do
    context '正常系' do
      it '全ての項目が入力されていれば購入ができる' do
        item_order = FactoryBot.build(:item_order)
        expect(item_order).to be_valid
      end

      it '建物名が空でも購入できる' do
        item_order = FactoryBot.build(:item_order, building_name: '')
        expect(item_order).to be_valid
      end
    end

    context '異常系' do
      it 'token(クレジットカード情報)が空だと購入ができない' do
        item_order = FactoryBot.build(:item_order, token: nil)
        expect(item_order).to_not be_valid
      end

      it '郵便番号が空だと購入ができない' do
        item_order = FactoryBot.build(:item_order, postal_code: '')
        expect(item_order).to_not be_valid
      end

      it '郵便番号にハイフンがないと登録できない' do
        item_order = FactoryBot.build(:item_order, postal_code: '1234567')
        expect(item_order).to_not be_valid
      end

      it '郵便番号が8桁出ないと購入できない' do
        item_order = FactoryBot.build(:item_order, postal_code: '123-45678')
        expect(item_order).to_not be_valid
      end

      it '都道府県が"---"の場合は購入できない' do
        item_order = FactoryBot.build(:item_order, prefecture_id: '---')
        expect(item_order).to_not be_valid
      end

      it '都道府県がが空だと購入できない' do
        item_order = FactoryBot.build(:item_order, prefecture_id: '')
        expect(item_order).to_not be_valid
      end

      it '市区町村が空だと購入できない' do
        item_order = FactoryBot.build(:item_order, city_name: '')
        expect(item_order).to_not be_valid
      end

      it '番地が空だと購入できない' do
        item_order = FactoryBot.build(:item_order, block_name: '')
        expect(item_order).to_not be_valid
      end

      it '電話番号が空だと購入できない' do
        item_order = FactoryBot.build(:item_order, phone_number: '')
        expect(item_order).to_not be_valid
      end

      it '電話番号が11桁でなければ購入できない' do
        item_order = FactoryBot.build(:item_order, phone_number: '123456789012')
        expect(item_order).to_not be_valid
      end

      it '電話番号が11桁であれば購入できる' do
        item_order = FactoryBot.build(:item_order, phone_number: '12345678901')
        expect(item_order).to be_valid
      end

      it '電話番号が9桁以下では購入できない' do
        item_order = FactoryBot.build(:item_order, phone_number: '123456789')
        expect(item_order).to_not be_valid
      end

      it '電話番号が12桁以上では購入できない' do
        item_order = FactoryBot.build(:item_order, phone_number: '123456789012')
        expect(item_order).to_not be_valid
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        item_order = FactoryBot.build(:item_order, phone_number: '123-4567-8901')
        expect(item_order).to_not be_valid
      end

      it 'userが紐付いていなければ購入できない' do
        item_order = FactoryBot.build(:item_order, user: nil)
        expect(item_order).to_not be_valid
      end

      it 'itemが紐付いていなければ購入できない' do
        item_order = FactoryBot.build(:item_order, item: nil)
        expect(item_order).to_not be_valid
      end
    end
  end
end
