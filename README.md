# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |


### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| name                  | string     | null: false                    |
| detail                | text       | null: false                    |
| category_id           | integer    | null: false                    |
| item_condition_id     | integer    | null: false                    |
| delivery_condition_id | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| reach_date_id         | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments
- has_one    :order


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| tel_number         | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

- belongs_to :order



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item