# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| f_name_kanji | string | null: false |
| l_name_kanji | string | null: false |
| f_name_kana  | string | null: false |
| l_name_kana  | string | null: false |
| birthday     | date   | null: false |
### Association
- has_many :items
- has_many :purchases
## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| value            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| description      | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |
### Association
- belongs_to :purchase

