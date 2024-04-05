require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品登録' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
    end

    context '出品ができるとき' do
      it '全ての入力事項が存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it '商品の状態が「---」以外であれば登録できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end

      it '配送料の負担が「---」以外であれば登録できる' do
        @item.shipping_cost_id = 2
        expect(@item).to be_valid
      end

      it '発送元の地域が「---」以外であれば登録できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end

      it '発送までの日数が「---」以外であれば登録できる' do
        @item.shipping_duration_id = 2
        expect(@item).to be_valid
      end

      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'ユーザー登録している人でないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品名が空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空欄だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it '商品の状態の情報が「---」だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end

      it '配送料の負担の情報が「---」だと出品できない' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 0')
      end

      it '発送元の地域の情報が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '発送までの日数の情報が「---」だと出品できない' do
        @item.shipping_duration_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping duration must be other than 0')
      end

      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数字でないと出品できない' do
        @item.price = '１０００' # 全角数字
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
