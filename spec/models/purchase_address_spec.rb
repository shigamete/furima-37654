require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user1.id, purchase_id: user2.id)
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
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitieが空では購入できない' do
        @purchase_address.municipalitie = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalitie can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeに hyphen(-) が含まれていなければ購入できない' do
        @purchase_address.post_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが未選択(id = 1)では購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'phone_numberが10桁未満では購入できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'Phone_numberに hyphen(-) が含まれていると購入できない' do
        @purchase_address.phone_number = '111-222-333'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'user_idが紐付いていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
