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
| full_name1 | string | null: false |
| full_name2 | string | null: false |
| birthday   | string | null: false |
| profile    | text   | null: false |
### Association
- has_many :sell_products
- has_many :buy_products

## sell_products テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| category      | string     | null: false                    |
| living        | string     | null: false                    |
| condition     | integer    | null: false                    |
| shipping_cost | integer    | null: false                    |
| description   | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :buy_product

## buy_products テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_number  | text       | null: false                    |
| card_limit   | text       | null: false                    |
| card_code    | text       | null: false                    |
| postal_code  | text       | null: false                    |
| prefecture   | text       | null: false                    |
| municipality | text       | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| sell_product | references | null: false, foreign_key: true |
### Association
- belongs_to :sell_product
- belongs_to :user