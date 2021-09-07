require 'rails_helper'

RSpec.describe "Stores", type: :system do
  before do
    @store = FactoryBot.create(:store)
    @store.images = fixture_file_upload('/300x300.png')
    @user = @store.user
  end

  context '店舗登録ができるとき' do
    it '' do
      # 登録されているBasic認証のIDとPWで通過する
      basic_pass root_path
      binding.pry
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのボタンがあることを確認する

      # 投稿ページに移動する
      # フォームに情報を入力する
      # 送信するとTweetモデルのカウントが1上がることを確認する
      # 投稿完了ページに遷移することを確認する
      # 「投稿が完了しました」の文字があることを確認する
      # トップページに遷移する
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
  
    end
  end
end
