# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name1              | string | null: false |
| name2              | string | null: false |
| name3              | string | null: false |
| name4              | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth-date         | string | null: false |


### Association

- has_many :items
- has_many :comments
- has_one  :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| item_image         | string     | null: false                    |
| item_name          | string     | null: false                    |
| content            | string     | null: false                    |
| category           | integer    | null: false                    |
| item_condition     | integer    | null: false                    |
| delivery_condition | integer    | null: false                    |
| from_area          | integer    | null: false                    |
| reach_date         | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments
- has_one    :orders

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | integer    | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| item_condition     | string     | null: false                    |
| building_name      | string     | null: false                    |
| tel_number         | string     | null: false                    |
| reach_date         | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item