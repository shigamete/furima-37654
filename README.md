# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ---------------------------------------------------------|
| email              | string  | null: false, unique: true |  
| encrypted_password | string  | null: false,              |
| nickname           | string  | null: false,              |
| lastname_full      | string  | null: false,              |
| firstname_full     | string  | null: false,              |
| lastname_kana      | string  | null: false,              |
| firstname_kana     | string  | null: false,              |
| birth_year         | integer | null: false,              |
| birth_month        | integer | null: false,              |
| birth_day          | integer | null: false,              |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                        |
| ----------------------------------------------------------------|
| name              | string     | null: false                    |
| explan            | text       | null: false,                   |
| category          | string     | null: false,                   |
| status            | string     | null: false,                   |
| shippingfee_payer | string     | null: false,                   |
| shipping_souce    | string     | null: false,                   |
| shipping_days     | string     | null: false,                   |
| price             | integer    | null: false,                   |
| user              | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column    | Type       | Options                        |
| --------------------------------------------------------|
| user      | references | null: false, foreing_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype
- has_one :shipping_address

## shipping_address テーブル

| Column            | Type       | Options                        |
| ----------------------------------------------------------------|
| post_code         | string     | null: false                    |
| prefectures       | string     | null: false,                   |
| municipalities    | text       | null: false                    |
| address           | text       | null: false                    |
| building_name     | text       |                                |
| phone_number      | string     | null: false                    |
| purchase          | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase