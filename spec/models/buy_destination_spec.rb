require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_destination = FactoryBot.build(:BuyDestination, user: user.id, item: item.id)
    end

    context '商品購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_destination).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_destination.building_name = ''
        expect(@buy_destination).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @buy_destination.postal_code = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Postal code can't be blank")     
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_destination.postal_code = '1234567'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'delivery_area_idが空だと保存できないこと' do
        @buy_destination.delivery_area_id = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @buy_destination.house_number = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("House number can't be blank")     
      end
      it 'municipal_nameが空だと保存できないこと' do
        @buy_destination.municipal_name = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Municipal name can't be blank")     
      end
      it 'tellが空だと保存できないこと' do
        @buy_destination.tell = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Tell can't be blank")     
      end
      it 'userが空だと保存できないこと' do
        @buy_destination.user = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("User can't be blank")     
      end
      it 'itemが空だと保存できないこと' do
        @buy_destination.item = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空だと登録できないこと" do
        @buy_destination.token = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "都道府県に'---'が選択されていると保存ができないこと" do
        @buy_destination.delivery_area_id = '0'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '電話番号が12以上では登録できないこと' do
        @buy_destination.tell = '0000000000000'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Tell is invalid")     
      end
      it '電話番号が英数混合では登録できないこと' do
        @buy_destination.tell = '090abcdefgh'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Tell is invalid")     
      end
    end
  end


end