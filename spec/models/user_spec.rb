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
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '1a2b3c'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'lastname_fullが空では登録できない' do
        @user.lastname_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（姓）を入力してください'
      end
      it 'firstname_fullが空では登録できない' do
        @user.firstname_full = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（名）を入力してください'
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'フリガナ（姓）を入力してください'
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'フリガナ（名）を入力してください'
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '誕生日を入力してください'
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは128文字以内で入力してください'
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは半角英数字混合で入力してください'
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは半角英数字混合で入力してください'
      end
      it 'lastname_fullが半角では登録できない' do
        @user.lastname_full = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（姓）は全角で入力してください'
      end
      it 'firstname_fullが半角では登録できない' do
        @user.firstname_full = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（名）は全角で入力してください'
      end
      it 'lastname_kanaが平仮名では登録できない' do
        @user.lastname_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'フリガナ（姓）はカタカナで入力してください'
      end
      it 'firstname_kanaが平仮名では登録できない' do
        @user.firstname_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'フリガナ（名）はカタカナで入力してください'
      end
    end
  end
end
