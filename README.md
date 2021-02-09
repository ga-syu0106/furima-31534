# テーブルまとめ

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :trades


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| delivery_free_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| days_ship_id     | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_one :trade
- belongs_to :user


## tradesテーブル

| Column| Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ----       | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| trade           | references | null: false, foreign_key: true |

### Association

- belongs_to :trade
