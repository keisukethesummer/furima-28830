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

# データベース設計

## usersテーブル

|   Column        |  Type      |    Options    |
|-----------------|----------  |---------------|
|nickname         | string     |  null: false  |
|email            | string     |  null: false  |
|password         | string     |  null: false  |
|last_name        | string     |  null: false  |
|first_name       | string     |  null: false  |
|last_name_kana   | string     |  null: false  |
|first_name_kana  | string     |  null: false  |
|birth_year_id    | integer    |  null: false  |
|birth_month_id   | integer    |  null: false  |
|birth_day_id     | integer    |  null: false  | 

### Association

- has_many :items
- has_many :orders

## itemsテーブル

|Column             |Type       |   Options   |
|-------------------|-----------|-------------|
|user_id            | reference | null: false |
|item_name          | string    | null: false |
|image              | string    | null: false |
|description        | text      | null: false |
|price              | text      | null: false |
|category           | integer   | null: false |
|condition          | integer   | null: false |
|delivery_fee       | integer   | null: false |
|seller_prefecture  | integer   | null: false |
|shipment_day       | integer   | null: false |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル
|Column       |Type       | Options                       |
|-------------|-----------|-------------------------------|
|user_id      | reference |null: false, foreign_key: true |
|item_id      | reference |null: false, foreign_key: true |
|card_number  | integer   |null: false                    |
|cvc          | integer   |null: false                    |
|exp_month    | integer   |null: false                    |
|exp_year     | integer   |null: false                    |




### Association

- belongs_to :user
- has_one :address
- belongs_to :items

## addressesテーブル
|Column         |Type       |Option                          |
|---------------|-----------|--------------------------------|
|order_id       | reference | null: false, foreign_key: true |
|postal_number  | integer   | null: false                    |
|prefecture     | reference | null: false                    |
|city           | string    | null: false                    |
|house_number   | integer   | null: false                    |
|build_name     | string    |                                |
|phone_number   | integer   | null: false                    |

## Association

- belongs_to :order