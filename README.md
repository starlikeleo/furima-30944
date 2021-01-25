# DB 設計

## users table

| Column             | Type   | Options      |
|--------------------|--------|--------------|
| nickname           | string | unique: true |
| email              | string | null: false  |
| encrypted_password | string | null: false  |
| full_width_name    | text   | null: false  |
| kana_name          | text   | null: false  |
| birthday           | date   | null: false  |

### Association

* has_many :items
* has_many :buys

## items table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| user          | references | foreign_key: true |
| name          | text       | null: false       |
| description   | text       | null: false       |
| category      | integer    | null: false       |
| state         | integer    | null: false       |
| delivery_fee  | integer    | null: false       |
| area          | integer    | null: false       |
| delivery_date | integer    | null: false       |
| price         | integer    | null: false       |

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

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| buy             | references | foreign_key: true |
| postal_code     | string     | null: false       |
| delivery_area   | text       | null: false       |
| municipal_name  | text       | null: false       |
| house_number    | text       | null: false       |
| building_name   | text       | null: false       |
| tell            | string     | none              |

### Association

* belongs_to :buy
