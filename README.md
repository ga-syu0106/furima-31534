# テーブルまとめ

## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :favorites
- belongs_to :credit
- belongs_to :address


## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | text       | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| brand         | string     | null: false                    |
| state         | string     | null: false                    |
| delivery_free | string     | null: false                    |
| shopping_area | string     | null: false                    |
| days_ship     | string     | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :favorites
- belongs_to :user


## commentsテーブル

| Column| Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## favoritesテーブル

| Column| Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## creditsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| information      | string     | null: false                    |
| expiration_year  | string     | null: false                    |
| expiration_month | string     | null: false                    |
| security_code    | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## addresssテーブル

| Column        | Type       | Options                        |
| ------------- | ----       | ------------------------------ |
| postal_code   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
