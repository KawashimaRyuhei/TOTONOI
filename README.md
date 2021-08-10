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

| Column         | Type       | Options                        |
|--------------- |------------|--------------------------------|
| name           | string     | null: false                    |
| address        | string     | null: false                    |
| postal_code    | string     | null: false                    |
| telephone      | string     | null: false                    |
| url            | string     | null: false                    |
| closing_day_id | integer    | null: false                    |
| business_hour  | time       | null: false                    |
| fee            | integer    | null: false                    |
| water          | integer    | null: false                    |
| temperature    | integer    | null: false                    |
| television     | string     | null: false                    |
| bgm            | string     | null: false                    |
| user           | references | null: false,foreign_key: true  |


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