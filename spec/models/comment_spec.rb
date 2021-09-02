require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe do
    before do
      @content = FactoryBot.build(:comment)
    end
  
    context 'コメントが投稿できる' do
      it 'contentが入力されていればコメント投稿できる' do
        expect(@content).to be_valid
      end
    end

    context 'コメントが投稿できない' do
      it 'contentが空だと投稿できない' do
        @content.content = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Content can't be blank")
      end

      it 'userが紐づいていないと投稿できない' do
        @content.user = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("User must exist")
      end

      it 'storeが紐づいていないと投稿できない' do
        @content.store = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Store must exist")
      end
    end
  end
end
