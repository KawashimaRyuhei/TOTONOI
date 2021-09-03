##　アプリ名
サウナ検索アプリ TOTONOI

## 概要
ログインの有無に関わらず一覧ページ、もしくは検索結果からサウナを探すことができます。詳細ページではサウナや店舗の詳細な情報もあり、GoogleMapも利用することができます。  
ログインユーザーは店舗に対して「ヨカッタ！」やコメントを残すことができます。  
また、管理者のみ「サウナ登録」ボタンより登録ページに飛べます。  
店舗情報入力は複数画像、プレビュー機能がついています。

## 本番環境
https://sento-88.herokuapp.com/

テストログイン用アカウント  
・Eメール:test@gmail.com  
・パスワード:test15

## 制作背景
初見の店でもこのサイトを使えば、事前に得たい情報を得られるようにしたい。ということで作成しました。「どこよりも詳細なサウナ情報」をモットーにしています。  
私自身サウナが好きでよく行くのですが、初めて行く店舗であれば浴場内の設備配置やサウナの温度、休憩場所の種類（室内に椅子のみある、外で寝そべって休憩できるetc）など詳細を調べた上で訪問したいと考えています。  
しかし、店舗公式HPでそれらの情報が得られないことが多いです。  
また、類似サイトでも椅子や休憩場所の配置図までは掲載していなかったため需要があると考えました。

## DEMO
### トップページ
![トップページ](https://user-images.githubusercontent.com/58518385/130932485-186caa05-c8f2-4661-8255-b0e287d9a358.jpeg)  
  
トップページ兼一覧ページです。このページから店舗検索や店舗詳細ページに遷移することができます。

### 店舗詳細ページ
![demo](https://gyazo.com/04593a447f541e08663ecc73d3b1a9a3.gif)
  
詳細ページではサウナの詳細なステータスを確認できます。サウナ内の室温や水風呂の温度、休憩場所の確認ができます。またGoogleMapを埋め込んであるのでユーザーが店舗へ訪問しやすいようにしています。  
またコメント機能がついており、ログイン済みユーザーは店舗へのコメントをすることができます。

### ユーザー新規登録ページ
![demo](https://gyazo.com/2ba8dd9ff4dfd2ed2209597d4e234c3d.gif)
  
ニックネームとメールアドレス、パスワードでユーザー登録ができます。

### ログインページ
![demo](https://gyazo.com/dc0a7c7ad7cbd0d3f2368e5d274f6a9d.gif)
  
登録済みのユーザーがメールアドレスとパスワードを使ってログインができます。

### 店舗登録ページ
![demo](https://gyazo.com/d0d67f02a92be84cb1151a2bd7dc36ba.gif)
  
管理者が店舗情報を登録できます。複数画像が添付出来、添付した画像はプレビューで確認することができます。

## 工夫したポイント
必要な情報を得ながらも、シンプルな見た目になるよう意識しました。
また、ログインなしで必要な情報は得られるようにしました。

## 使用技術（開発環境）
### バックエンド
Ruby, Ruby on Rails

### フロント
HTML5, CSS, JavaScript, JQuery

### インフラ
AWS(S3), GoogleMapsPlatform

### Webサーバ（本番環境）

### アプリケーションサーバ(本番環境)

### ソース管理
GitHub, GitHubDesktop

### テスト
RSpec

### エディタ
VSCode

## 課題や今後実装したい機能 
店舗掲載依頼や店舗情報修正依頼用の問い合わせページが未実装になっているため追加実装したいと考えています。  
ログイン機能もメールアドレスによるログインのみなので、GoogleやSNSアカウントでのログインを追加したいです。  
掲載店舗は現在管理者のみが登録・編集・削除できるようになっています。今後掲載店舗数を増やすにあたりユーザーも店舗登録できた方が良いのか、ユーザーが増加した場合不適切な登録女湯法を管理し切れるのか、うまい管理方法がないか模索しています。


# テーブル設計

## usersテーブル

| Column     | Type   | Options                   |
|------------|------- |---------------------------|
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |


### Association

- has_many :stores
- has_many :comments
- has_many :goods
- has_many :inquires

## storesテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| address         | string     | null: false                    |
| postal_code     | string     | null: false                    |
| telephone       | string     | null: false                    |
| url             | string     | null: false                    |
| closing_day     | string     | null: false                    |
| business_hour   | string     | null: false                    |
| fee             | integer    | null: false                    |
| parking_car     | string     | null: false                    |
| parking_bicycle | string     | null: false                    |
| towel_rental    | string     | null: false                    |
| water           | integer    | null: false                    |
| water_depth     | string     | null: false                    |
| water_quality   | string     | null: false                    |
| temperature     | integer    | null: false                    |
| roryu_status    | string     | null: false                    |
| roryu_time      | string     | null: false                    |
| air_bath        | string     | null: false                    |
| break_place     | string     | null: false                    |
| television      | string     | null: false                    |
| bgm             | string     | null: false                    |
| user            | references | null: false,foreign_key: true  |


### Association

- has_many   :comments
- has_many   :goods
- belongs_to :user

## commentsテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| store     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :store

## goodsテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| store     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :store

## Inquiriesテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| status_id | integer    | null: false                    |
| title     | references | null: false                    |
| text      | references | null: false                    |
| user      | references | null: false, foreign_key: true |

- belongs_to :user
