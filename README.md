# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :products

## products テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| image             | string     | null: false |
| title             | string     | null: false |
| description       | string     | null: false |
| category          | string     | null: false |
| product_condition | string     | null: false |
| shipping_fee      | string     | null: false |
| area              | string     | null: false |
| shipping_date     | string     | null: false |
| price             | string     | null: false |
| user_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :destinations

## destinations テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | string     | null: false |
| expiration_date  | date       | null: false |
| security_code    | string     | null: false |
| post_code        | string     | null: false |
| prefecture       | string     | null: false |
| municipalities   | string     | null: false |
| address          | string     | null: false |
| building         | string     | null: false |
| telephone_number | string     | null: false |

### Association

- belongs_to :product