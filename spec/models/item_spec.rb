require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品する' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されている' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("品名を入力してください")
      end

      it '説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("説明を入力してください")
      end

      it 'カテゴリーidが「０」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーが選択されていません")
      end
      it 'コンディションidが「０」だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("品物の状態が選択されていません")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
