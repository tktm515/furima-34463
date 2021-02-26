# テーブル設計

## users テーブル
| Column            | Type         | Options        |
| ----------------- | ------------ | -------------- |
| nickname          | string       | null: false    |
| email             | string       | null: false    |
| password          | string       | null: false    |
| first_name        | string       | null: false    |
| family_name       | string       | null: false    |
| first_name_kana   | string       | null: false    |
| family_name_kana  | string       | null: false    |
| birthday          | integer      | null: false    |

### Association
- has_many :purchases
- has_many :comments
- has_many :items

## items　テーブル
| Column           | Type          | Options                                     |
| ---------------- | ------------- | ------------------------------------------- |
| image            | integer       | (ActiveStorage) null:false                  |
| item_name        | text          | null: false                                 |
| description      | text          | null: false                                 |
| category         | integer       | (ActiveHash) null:false  foreign_key: true  |
| status           | integer       | (ActiveHash) null:false  foreign_key: true  |
| shipping         | integer       | (ActiveHash) null:false  foreign_key: true  |
| prefecture       | integer       | (ActiveHash) null:false  foreign_key: true  |
| shipping_days    | integer       | (ActiveHash) null:false  foreign_key: true  |
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
| user         | refences     | null: false, foreign_key: true  |
| item         | refences     | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## purchases　テーブル
| Column       | Type         | Options                         |
| ------------ | ------------ | ------------------------------- |
| user         | refences     | null: false, foreign_key: true  |
| item         | refences     | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :addresses

## addresses　テーブル
| Column           | Type          | Options                                     |
| ---------------- | ------------- | ------------------------------------------- |
| post_num         | integer       | null: false                                 |
| prefectures      | integer       | (ActiveHash) null:false  foreign_key: true  |
| city             | string        | null: false                                 |
| address          | string        | null: false                                 |
| bulding_name     | string        |                                             |
| phone_num        | string        | null:false                                  |
| purchase         | references    | null: false, foreign_key: true              |

### Association
- belongs_to :purchases
