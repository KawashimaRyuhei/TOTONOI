require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe do
    before do
      @inquiry = FactoryBot.build(:inquiry)
    end

    context '問い合わせ内容が送信できる' do
      it '必須情報が全て入力されていれば送信できる' do
        expect(@inquiry).to be_valid
      end
    end

    context '問い合わせ内容が送信できない' do
      it 'nameが空だと送信できない' do
        @inquiry.name = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include('Name 名前を入力してください')
      end

      it 'emailが空だと送信できない' do
        @inquiry.email = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include('Email メールアドレスを入力してください')
      end

      it 'emailに@がないと送信できない' do
        @inquiry.email = 'aaa'
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include('Email メールアドレスを入力してください')
      end

      it 'emailが全角だと送信できない' do
        @inquiry.email = 'ＡＡＡ'
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include('Email メールアドレスを入力してください')
      end

      it 'emailが英数字以外だと送信できない' do
        @inquiry.email = 'あ亜ｱ'
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include('Email メールアドレスを入力してください')
      end

      it 'messageが空だと送信できない' do
        @inquiry.message = ''
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include('Message メッセージを入力してください')
      end
    end
  end
end
