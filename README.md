## users

|   Column          |   Type   |   Options                |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |
|first_name         |string    |null: false               |
|last_name          |string    |null: false               |
|first_name_kana    |string    |null: false               |
|last_name_kana     |string    |null: false               |
|birth_day          |date      |null: false               |

### Association
has_many :items
has_many :orders

## items

|   Column          |   Type   |   Options                     |
|-------------------|----------|--------------------¥----------|
|item_name          |string    |null: false                    |
|description        |text      |null: false                    |
|category_id        |integer   |null: false                    |
|condition_id       |integer   |null: false                    |
|delivery_free_id   |integer   |null: false                    |
|prefecture_id      |integer   |null: false                    |
|delivery_day_id    |integer   |null: false                    |
|price              |integer   |null: false                    |
|user               |references|null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order

## addresses

|   Column          |   Type   |   Options                     |
|-------------------|----------|-------------------------------|
|postal_code        |string    |null: false                    |
|prefecture         |integer   |null: false                    |
|city               |string    |null: false                    |
|house_number       |string    |null: false                    |
|building           |string    |                               |
|phone_number       |string    |null: false                    |
|order_record       |references|null: false, foreign_key: true |

### Association
belongs_to :order

## orders

|   Column          |   Type   |   Options                     |
|-------------------|----------|-------------------------------|
|user               |references|null: false, foreign_key: true |
|item               |references|null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address