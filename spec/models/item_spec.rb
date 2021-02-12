require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '適切な情報が入力されたとき、商品が保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it 'ユーザーが紐付いていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像がついていない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品名が空' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品の説明が空' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品のカテゴリーが空' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品のカテゴリーで---を選択している' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品の状態についての情報が空' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品の状態で---を選択している' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '配送料の負担についての情報が空' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '配送料の負担で---を選択している' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '発送元の地域についての情報が空' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '発送元の地域で---を選択している' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '発送までの日数についての情報が空' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '発送までの日数で---を選択している' do
        @item.delivery_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '価格についての情報が空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '価格が300円未満' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '価格が10,000,000円以上' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '価格に半角数字以外が含まれている' do
        @item.price = 'A0000000'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '価格が半角英数のみ' do
        @item.price = 'ABCDEFGH'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '価格に全角文字が含まれている' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
    end
  end
end