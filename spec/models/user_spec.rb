require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されている' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      # 社員番号
      it 'employee_numberが空だと登録できない' do
        @user.employee_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("社員番号を入力してください")
      end
      it 'employee_numberが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.employee_number = @user.employee_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include("社員番号はすでに存在します")
      end

      # 苗字
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字が全角で入力されていません")
      end

      # 名前
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が全角で入力されていません")
      end

      # 苗字（カナ）
      it 'last_name_readingが空だと登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it 'last_name_readingが全角カタカナでないと登録できない' do
        @user.last_name_reading = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）がカタカナで入力されていません")
      end

      # 名前（カナ）
      it 'first_name_readingが空だと保存でないと登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'first_name_readingが全角カタカナでないと登録できない' do
        @user.first_name_reading = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）がカタカナで入力されていません")
      end

      # ニックネーム
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'nicknameが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("ニックネームはすでに存在します")
      end

      # メールアドレス
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it 'emailが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      # パスワード
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(再確認)とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
      it 'passwordがpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(再確認)とパスワードの入力が一致しません")
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(再確認)とパスワードの入力が一致しません")
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(再確認)とパスワードの入力が一致しません")
      end
      it '全角文字を含むpasswordは登録できない' do
        @user.password = 'あbcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(再確認)とパスワードの入力が一致しません")
      end
    end
  end
end
