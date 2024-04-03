#　テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| description | text    | null: false |
| price       | integer | null: false |
| status      | integer | null: false |
| created_at  | date    | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city_name     | string  | null: false |
| block_name    | string  | null: false |
| building_name | string  | null: false |

### Association

- belongs_to :order