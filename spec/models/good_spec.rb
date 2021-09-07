require 'rails_helper'

RSpec.describe Good, type: :model do
  describe do
    before do
      @good = FactoryBot.build(:good)
    end

    context 'goodモデルに保存できる' do
      it 'user_idとstore_idがあれば保存できる' do
        expect(@good).to be_valid
      end
    end

    context 'goodモデルに保存できない' do
      it 'user_idと紐づいていないと保存できない' do
        @good.user = nil
        @good.valid?
        expect(@good.errors.full_messages).to include('User must exist')
      end

      it 'store_idと紐づいていないと保存できない' do
        @good.store = nil
        @good.valid?
        expect(@good.errors.full_messages).to include('Store must exist')
      end
    end
  end
end
