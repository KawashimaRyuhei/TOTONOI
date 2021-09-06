require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Stores", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @store_image = Faker::Lorem.sentence
  end

  context '店舗登録ができるとき'
    # 登録されているBasic認証のIDとPWで通過する
    basic_pass root_path
    # ログインする
    expect(body).to have_content('新規登録')
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    # ログインボタンを押す
    find('input[name="commit"]').click
    # トップページへ遷移することを確認する
    expect(current_path).to eq root_path
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
