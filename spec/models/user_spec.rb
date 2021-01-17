require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーの新規登録' do
    it '全てが正しく入力してあれば登録できること' do
      expect(@user).to be_valid
    end

    it 'ニックネームが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      user1 = FactoryBot.build(:user, email: @user.email)
      user1.valid?
      expect(user1.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含まないと登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'メールアドレスは、@の後に文字を含まないと登録できないこと' do
      @user.email = 'aaaaaa@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空だと登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力でないと登録できないこと' do
      @user.password = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力でないと登録できないこと(半角英語のみ)' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字のみで両方使用してください')
    end

    it 'パスワードは、半角英数字混合での入力でないと登録できないこと(半角数字のみ)' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字のみで両方使用してください')
    end

    it 'パスワードは、半角英数字混合での入力でないと登録できないこと(英語と全角数字)' do
      @user.password = 'aaaaa１'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字のみで両方使用してください')
    end

    it 'パスワードは、確認用を含めて2回入力しないと登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード（確認用）、値の一致しないと登録できないこと' do
      @user.password_confirmation = 'aaaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報確認' do
    it 'ユーザー本名は、名字が空だと登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名は、名前が空だと登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）での入力でないと登録できないこと' do
      @user.last_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
    end

    it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）での入力でないと登録できないこと' do
      @user.first_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end

    it 'ユーザー本名のフリガナは、名字が空だと登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'ユーザー本名のフリガナは、名前が空だと入力できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'ユーザー本名のフリガナは、名字が全角(カタカナ)での入力でないと登録できないこと' do
      @user.last_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
    end

    it 'ユーザー本名のフリガナは、名前が全角(カタカナ)での入力でないと登録できないこと' do
      @user.first_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
    end

    it '生年月日が空だと登録できないこと' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
