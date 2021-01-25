# DB 設計

## users table

| Column             | Type   | Options      |
|--------------------|--------|--------------|
| nickname           | string | unique: true |
| email              | string | null: false  |
| encrypted_password | string | null: false  |
| family_name        | string | null: false  |
| first_name         | string | null: false  |
| kana_family_name   | string | null: false  |
| kana_first_name    | string | null: false  |
| birthday           | date   | null: false  |

### Association

* has_many :items
* has_many :buys

## items table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| user             | references | foreign_key: true |
| name             | text       | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| state_id         | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| area_id          | integer    | null: false       |
| delivery_date_id | integer    | null: false       |
| price            | integer    | null: false       |

### Association

* belongs_to :user
* has_one :buy

## buys table

| Column  | Type       | Options           |
|---------|------------|-------------------|
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :destination

## destinations table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| buy              | references | foreign_key: true |
| postal_code      | string     | null: false       |
| area_id          | integer    | null: false       |
| municipal_name   | string     | null: false       |
| house_number     | string     | null: false       |
| building_name    | string     |                   |
| tell             | string     | null: false       |

### Association

* belongs_to :buy
