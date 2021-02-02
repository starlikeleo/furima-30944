require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '適切な情報が入力されたとき、ユーザー新規登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性でない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない' do
        @user.email = 'aaaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみ' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmation is invalid')
      end
      it 'passwordが半角英字のみ' do
        @user.password = 'Abcdef'
        @user.password_confirmation = 'Abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmation is invalid')
      end
      it 'パスワードが全角では登録できない' do
        @user.password = 'あ123456'
        @user.password_confirmation = 'あ123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmation is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していない' do
        @user.password = 'aa123456'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameが漢字・カタカナ・平仮名でない' do
        @user.family_name = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが漢字・カタカナ・平仮名でない' do
        @user.first_name = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'kana_family_nameが空' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it 'kana_first_nameが空' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_family_nameがカナでない' do
        @user.kana_family_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid')
      end
      it 'kana_first_nameがカナでない' do
        @user.kana_first_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it '誕生日が空' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end