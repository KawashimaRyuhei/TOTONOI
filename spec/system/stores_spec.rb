require 'rails_helper'

RSpec.describe 'Stores', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @store = FactoryBot.build(:store)
  end

  context '店舗登録ができるとき' do
    it '正確に店舗情報を入力すれば店舗登録ができる' do
      # 登録されているBasic認証のIDとPWで通過する
      basic_pass root_path
      # ログインする
      sign_in(@user)
      # 店舗投稿ページへのボタンがあることを確認する
      expect(page).to have_content('サウナ登録')
      # 投稿ページに移動する
      visit new_store_path
      # フォームに情報を入力する
      fill_in 'store[name]', with: @store.name
      fill_in 'store[postal_code]', with: @store.postal_code
      fill_in 'store[address]', with: @store.address
      fill_in 'store[telephone]',  with: @store.telephone
      fill_in 'store[url]' , with: @store.url
      fill_in 'store[closing_day]', with: @store.closing_day
      fill_in 'store[business_hour]', with: @store.business_hour
      fill_in 'store[parking_car]', with: @store.parking_car
      fill_in 'store[parking_bicycle]', with: @store.parking_bicycle
      fill_in 'store[fee]', with: @store.fee
      fill_in 'store[towel_rental]', with: @store.towel_rental
      fill_in 'store[roryu_status]', with: @store.roryu_status
      fill_in 'store[roryu_time]',  with: @store.roryu_time
      fill_in 'store[temperature]', with: @store.temperature
      fill_in 'store[television]', with: @store.television
      fill_in 'store[water]', with: @store.water
      fill_in 'store[water_depth]', with: @store.water_depth
      fill_in 'store[water_quality]', with: @store.water_quality
      fill_in 'store[air_bath]', with: @store.air_bath
      fill_in 'store[break_place]', with: @store.break_place
      fill_in 'store[bgm]', with: @store.bgm
      image_path1 = Rails.root.join('spec/fixtures/300x300.png')
      attach_file('store[images][]', image_path1)
      # 送信するstoreモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Store.count}.by(1)
      # 投稿が完了するとトップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容が存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容が存在することを確認する（テキスト）
      expect(page).to have_content(@store.name)
    end
  context '店舗登録ができないとき' do
    it '情報に不備があると店舗登録できない' do
      
    end
  end
end
