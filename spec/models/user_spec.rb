require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録(ユーザー情報)' do
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
    it 'emailが重複しては登録ができない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'emailに@が含んでいなければ登録できない' do
      @user.email = 'ttttttttt'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'パスワードがなければ登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが6文字以下だと登録できない' do
      @user.password = '123rr'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワードは半角数字のみだと登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードは半角英字のみだと登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードは全角が含むと登録できない' do
      @user.password = '123アイウ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'パスワードと確認用パスワードが一致しないと登録できない' do
      @user.password_confirmation = '1234rr'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end


  describe 'ユーザー新規登録(本人情報)' do
    it 'お名前(全角)の名字がないと登録できない' do
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'お名前(全角)の名前がないと登録できない' do
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'お名前(全角)の名字は全角でないと登録できない' do
      @user.last_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'お名前(全角)の名前は全角でないと登録できない' do
      @user.first_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'お名前カナ(全角)の名字がないと登録できない' do
      @user.last_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it 'お名前カナ(全角)の名前がないと登録できない' do
      @user.first_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'お名前(全角)の名字は全角(カタカナ)でないと登録できない' do
      @user.last_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it 'お名前(全角)の名前は全角(カタカナ)でないと登録できない' do
      @user.first_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it '生年月日の入力がないと登録できない' do
      @user.birth_day = "1999"
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
  end
end
