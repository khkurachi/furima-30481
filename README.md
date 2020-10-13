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
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| 性          | string | null: false |
| 名          | string | null: false |
| セイ        | string | null: false |
| メイ        | string | null: false |
| birthday   | date   | null: false |
| profile    | text   | null: false |
### Association
- has_many :items
- has_many :purchases
- has_many :transactions
## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| category      | integer    | null: false                    |
| living        | integer    | null: false                    |
| condition     | integer    | null: false                    |
| shipping_cost | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| description   | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :purchase
- has_many :transactions

## purchases テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| municipality | text       | null: false                    |
| address      | text       | null: false                    |
| building     | text       |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| sell_product | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user

## transactions テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| sell_product_id | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item