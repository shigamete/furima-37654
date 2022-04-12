require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.1
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入ができる' do
      it 'post_code,prefecture_id,municipalitie,address,building_name,phone_number,tokenが存在すれば購入ができる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入ができない' do
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '郵便番号を入力してください'
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '都道府県を選択してください'
      end
      it 'municipalitieが空では購入できない' do
        @purchase_address.municipalitie = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '市区町村を入力してください'
      end
      it 'addressが空では購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '番地を入力してください'
      end
      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号を入力してください'
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'クレジットカード情報を入力してください'
      end
      it 'post_codeに hyphen(-) が含まれていなければ購入できない' do
        @purchase_address.post_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '郵便番号はハイフン(-)を入力してください'
      end
      it 'prefecture_idが未選択(id = 1)では購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '都道府県を選択してください'
      end
      it 'phone_numberが10桁未満では購入できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号は10文字以上で入力してください'
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号は11文字以内で入力してください'
      end
      it 'Phone_numberに hyphen(-) が含まれていると購入できない' do
        @purchase_address.phone_number = '111-222-333'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '電話番号は数値で入力してください'
      end
      it 'user_idが紐付いていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include 'ユーザーを入力してください'
      end
      it 'item_idが紐付いていなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include '商品を入力してください'
      end
    end
  end
end
