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
| f_name1    | string | null: false |
| l_name1    | string | null: false |
| f_name2    | string | null: false |
| l_name2    | string | null: false |
| birthday   | date   | null: false |
| profile    | text   | null: false |
### Association
- has_many :items
- has_one :transaction
## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| category_id      | integer    | null: false                    |
| living_id        | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost-id | integer    | null: false                    |
| shipping_days-id | integer    | null: false                    |
| description      | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :transaction

## transactions テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| sell_product_id | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase

## purchases テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture-id | integer    | null: false                    |
| municipality  | text       | null: false                    |
| address       | text       | null: false                    |
| building      | text       |                                |
| phone_number  | string     | null: false                    |
### Association
- belongs_to :transaction

