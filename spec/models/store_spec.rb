require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '店舗情報の投稿' do
    
    let(:store) {FactoryBot.build(:store)}
    let(:images) {fixture_file_upload("/サウナの梅湯.jpeg","/300x300.png")}
    
    context '店舗情報が投稿できる' do
      it '必要な情報が全て入力されていれば投稿できる' do
        pending
        expect(store).to be_valid
      end
    end

    context '店舗情報が投稿できない' do
      it 'nameが空だと投稿できない' do
        store.name = ''
        store.valid?
        expect(store.errors.full_messages).to include("Name can't be blank")
      end
      it 'addressが空だと投稿できない' do
        store.address = ''
        store.valid?
        expect(store.errors.full_messages).to include("Address can't be blank")
      end
      it 'postal_codeが空だと投稿できない' do
        store.postal_code = ''
        store.valid?
        expect(store.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'telephoneが空だと投稿できない' do
        store.telephone = ''
        store.valid?
        expect(store.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'urlが空だと投稿できない' do
        store.url = ''
        store.valid?
        expect(store.errors.full_messages).to include("Url can't be blank")
      end
      it 'closing_dayが空だと投稿できない' do
        store.closing_day = ''
        store.valid?
        expect(store.errors.full_messages).to include("Closing day can't be blank")
      end
      it 'business_hourが空だと投稿できない' do
        store.business_hour = ''
        store.valid?
        expect(store.errors.full_messages).to include("Business hour can't be blank")
      end
      it 'feeが空だと投稿できない' do
        store.fee = ''
        store.valid?
        expect(store.errors.full_messages).to include("Fee can't be blank")
      end
      it 'parking_carが空だと投稿できない' do
        store.parking_car = ''
        store.valid?
        expect(store.errors.full_messages).to include("Parking car can't be blank")
      end
      it 'parking_bicycleが空だと投稿できない' do
        store.parking_bicycle = ''
        store.valid?
        expect(store.errors.full_messages).to include("Parking bicycle can't be blank")
      end
      it 'towel_rentalが空だと投稿できない' do
        store.towel_rental = ''
        store.valid?
        expect(store.errors.full_messages).to include("Towel rental can't be blank")
      end
      it 'waterが空だと投稿できない' do
        store.water = ''
        store.valid?
        expect(store.errors.full_messages).to include("Water can't be blank")
      end
      it 'water_depthが空だと投稿できない' do
        store.water_depth = ''
        store.valid?
        expect(store.errors.full_messages).to include("Water depth can't be blank")
      end
      it 'water_qualityが空だと投稿できない' do
        store.water_quality = ''
        store.valid?
        expect(store.errors.full_messages).to include("Water quality can't be blank")
      end
      it 'temperatureが空だと投稿できない' do
        store.temperature = ''
        store.valid?
        expect(store.errors.full_messages).to include("Temperature can't be blank")
      end
      it 'roryu_statusが空だと投稿できない' do
        store.roryu_status = ''
        store.valid?
        expect(store.errors.full_messages).to include("Roryu status can't be blank")
      end
      it 'roryu_timeが空だと投稿できない' do
        store.roryu_time = ''
        store.valid?
        expect(store.errors.full_messages).to include("Roryu time can't be blank")
      end
      it 'air_bathが空だと投稿できない' do
        store.air_bath = ''
        store.valid?
        expect(store.errors.full_messages).to include("Air bath can't be blank")
      end
      it 'break_placeが空だと投稿できない' do
        store.break_place = ''
        store.valid?
        expect(store.errors.full_messages).to include("Break place can't be blank")
      end
      it 'televisionが空だと投稿できない' do
        store.television = ''
        store.valid?
        expect(store.errors.full_messages).to include("Television can't be blank")
      end
      it 'bgmが空だと投稿できない' do
        store.bgm = ''
        store.valid?
        expect(store.errors.full_messages).to include("Bgm can't be blank")
      end
      it 'imagesが空だと投稿できない' do
        store.images = nil
        store.valid?
        expect(store.errors.full_messages).to include("Images can't be blank")
      end
      it 'user_idと紐づいていないと投稿できない' do
        store.user = nil
        store.valid?
        expect(store.errors.full_messages).to include("User must exist")
      end

    end
  end
end
