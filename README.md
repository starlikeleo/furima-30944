# DB 設計

## users table

| Column          | Type   | Options      |
|-----------------|--------|--------------|
| nickname        | text   | unique: true |
| email           | string | null: false  |
| password        | string | null: false  |
| full_width_name | text   | null: false  |
| kana_name       | text   | null: false  |
| birthday        | text   | null: false  |

### Association

* has_many :items
* has_many :buys

## items table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| user          | references | foreign_key: true |
| item_name     | text       | null: false       |
| text          | text       | null: false       |
| category      | text       | null: false       |
| state         | text       | null: false       |
| delivery_fee  | text       | null: false       |
| area          | text       | null: false       |
| delivery_date | text       | null: false       |
| price         | string     | null: false       |

### Association

* belongs_to :user
* has_one :buy

## buys table

| Column  | Type       | Options           |
|---------|------------|-------------------|
| user    | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :destination

## destinations table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| buy_id          | references | foreign_key: true |
| postal_code     | string     | null: false       |
| delivery_area   | text       | null: false       |
| municipal_name  | text       | null: false       |
| house_number    | text       | null: false       |
| building_name   | text       | null: false       |
| tell            | string     | null: false       |

### Association

* belongs_to :buy
