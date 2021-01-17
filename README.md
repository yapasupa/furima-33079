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

| Column             |Type    | Options                  |
| ------------------ |------  | -------------------------|
| nickname           | string | null: false              |
| email              | string | null: false  unique: true|
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_furigana| string | null: false              |
| last_name_furigana | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :records


## item テーブル

| Column             |Type          | Options                    |
| ------------------ |------------- | -------------------------- |
| name               | string       |null:false                  |
| text               | text         |null:false                  |
| price              | integer      |null:false                  |
| user               | references   |null:false foreign_key true |
| category_id        | integer      |null:false                  |ActiveHashで実装
| state_id           | integer      |null:false                  |ActiveHashで実装
| delivery_fee_ id   | integer      |null:false                  |ActiveHashで実装
| delivery_area_id   | integer      |null:false                  |ActiveHashで実装
| delivery_date_id   | integer      |null:false                  |ActiveHashで実装


### Association

- belongs_to :user
- has_one :record



## record テーブル
 
 Column    |Type        | Options                      |
|--------  |----------- | -----------------------------|
| user     | references | null:false,foreign_key true  |
| item     | references | null:false,foreign_key true  |


### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## address テーブル


| Column            |Type        | Options                   |
|----------         |---------   | --------------------------|
| postcode          | string     |null:false                 |
| delivery_area_id  | integer    |null:false                 |
| city              | string     |null:false                 |
| block             | string     |null:false                 |
| building          | string     |                           |
| tel               | string     |null:false                 |
| record            | references |null:false,foreign_key true|


### Association
- belongs_to :record
