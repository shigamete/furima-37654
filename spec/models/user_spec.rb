require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nickname,email,password,password_confirmation,lastname_full,firstname_full,lastname_kana,firstname_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password ='123456'
        @user.password_confirmation = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'lastname_fullが空では登録できない' do
        @user.lastname_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname full can't be blank"
      end
      it 'firstname_fullが空では登録できない' do
        @user.firstname_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname full can't be blank"
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'lastname_fullが半角では登録できない' do
        @user.lastname_full =  'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname full is invalid. Input full-width characters"
      end
      it 'firstname_fullが半角では登録できない' do
        @user.firstname_full =  'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname full is invalid. Input full-width characters"
      end
      it 'lastname_kanaが平仮名では登録できない' do
        @user.lastname_kana =  'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana is invalid. Input full-width katakana characters"
      end
      it 'firstname_kanaが平仮名では登録できない' do
        @user.firstname_kana =  'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana is invalid. Input full-width katakana characters"
      end
    end
  end
end
