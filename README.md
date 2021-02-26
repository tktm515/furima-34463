# テーブル設計

## users テーブル
| Column             | Type         | Options                   |
| ------------------ | ------------ | ------------------------- |
| nickname           | string       | null: false               |
| email              | string       | null: false unique:true   |
| encrypted_password | string       | null: false               |
| first_name         | string       | null: false               |
| family_name        | string       | null: false               |
| first_name_kana    | string       | null: false               |
| family_name_kana   | string       | null: false               |
| birthday           | date         | null: false               |

### Association
- has_many :purchases
- has_many :comments
- has_many :items

## items　テーブル
| Column           | Type          | Options                                     |
| ---------------- | ------------- | ------------------------------------------- |
| item_name        | string        | null: false                                 |
| description      | text          | null: false                                 |
| category_id      | integer       | (ActiveHash) null:false                     |
| status_id        | integer       | (ActiveHash) null:false                     |
| shipping_id      | integer       | (ActiveHash) null:false                     |
| prefecture_id    | integer       | (ActiveHash) null:false                     |
| shipping_day_id  | integer       | (ActiveHash) null:false                     |
| prise            | integer       | null: false                                 |
| user             | references    | null: false, foreign_key: true              |

### Association
-belongs_to :user
-has_many   :comments
-has_one    :purchase

## comments　テーブル
| Column       | Type         | Options                         |
| ------------ | ------------ | ------------------------------- |
| text         | text         | null: false                     |
| user         | references   | null: false, foreign_key: true  |
| item         | references   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## purchases　テーブル
| Column       | Type         | Options                         |
| ------------ | ------------ | ------------------------------- |
| user         | references   | null: false, foreign_key: true  |
| item         | references   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses　テーブル
| Column           | Type          | Options                                     |
| ---------------- | ------------- | ------------------------------------------- |
| post_num         | string        | null: false                                 |
| prefecture_id    | integer       | (ActiveHash) null:false                     |
| city             | string        | null: false                                 |
| address          | string        | null: false                                 |
| building_name    | string        |                                             |
| phone_num        | string        | null:false                                  |
| purchase         | references    | null: false, foreign_key: true              |

### Association
- belongs_to :purchase
