# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- belongs_to :history
- has_many :products

## products テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| shipping_fee_id      | integer    | null: false                    |
| area_id              | integer    | null: false                    |
| shipping_date_id     | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :history

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_id          | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | null: false                    |
| telephone_number | string     | null: false                    |
| history          | references | null: false, foreign_key: true |

### Association

- belongs_to :history

##   Histories テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :destination